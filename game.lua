function gameUpdate(dt)
    for i = 1,table.getn(sprite) do
        if sprite[i].char == 'tero' then
            --Klonoa is ALWAYS sprite[1] so every time sprite[i] is used,
            --it's just to make copypasta between Klonoa and another
            --character (which might have any sprite ID) easier.
            rcol(i)
            --Do a collision check
            if sprite[i].block.s then
            --if you're on solid ground...
                if sprite[i].anim == 'down' then
                    --[[
                    If you fall from too great a height, you'll have to wait a few frames
                    for the 'shit, that landing hurt' animation
                    edit: because of how rcol() works, it always plays
                    when you hit the ground. It used to ask for sprite[i].vy,
                    but if sprite[i].block.s is true then it'll always = 0
                    ]]--
                    animation.change(i, 'tero', 'hfall')
                    sound.play('tero', 'nland')
                    sprite[i].vx = 0
                end
                --If the falling animation is playing, switch it to the 'just hit the ground' animation
                
                if sprite[i].anim ~= 'hfall' then
                --Checking if the animation isn't 'hfall' makes sure you can't move
                --until the 'shit, that landing hurt' animation is over.
                    if down('right') and not down('left') and not sprite[i].block.e then
                        sprite[i].vx = 1
                        animation.change(i, 'tero', 'run')
                        sprite[i].f = true
                    elseif down('left') and not down('right') and not sprite[i].block.w then
                        sprite[i].vx = -1
                        animation.change(i, 'tero', 'run')
                        sprite[i].f = false
                    else
                        sprite[i].vx = 0
                        animation.change(i, 'tero', 'idle')
                    end
                end
                sprite[i].y = math.floor(sprite[i].y/16)*16
                --Make sure his feet don't go through the ground
                
                
            else
            --Else if not touching the ground...
                sound.stop('tero', 'nland')
                if down('right') and not down('left') and not sprite[i].block.e then
                    sprite[i].vx = 1
                    sprite[i].f = true
                elseif down('left') and not down('right') and not sprite[i].block.w then
                    sprite[i].vx = -1
                    sprite[i].f = false
                else
                    sprite[i].vx = 0
                end
                --Mid-air control
                sprite[i].vy = sprite[i].vy + dt * 2
                --Apply gravity
                if sprite[i].vy > 0 then
                    animation.change(i, 'tero', 'down')
                elseif sprite[i].vy < 0 then
                    animation.change(i, 'tero', 'up')
                end
                --Set falling/jumping animation
            end
            
            if sprite[i].anim == 'hfall' and sprite[i].frame == sprite[i].frames - 1 then
                animation.change(i, 'tero', 'idle')
                sound.stop('tero', 'njump')
            end
            --Makes sure the 'just hit the ground' animation in proceeded by the idle animation
            --Warning: this skips the last frame!
            
            
            if sprite[i].anim == 'run' and sprite[i].frame == 3  or sprite[i].anim == 'run' and sprite[i].frame == 7 then
                sound.play('tero', 'nwalk')
            elseif sprite[i].anim == 'run' and sprite[i].frame == 2  or sprite[i].anim == 'run' and sprite[i].frame == 6 then
                sound.stop('tero', 'nwalk')
            end
                        
            --Calculates when to play sounds, if they aren't already above
            
            
        end
        
        --Per character
        
        sprite[i].x = sprite[i].x + math.clamp(sprite[i].vx, -1, 1) * dt * 96
        sprite[i].y = sprite[i].y + math.clamp(sprite[i].vy, -1, 1) * dt * 192
        --Applies velocities
        --math.clamp keeps terminal velocity in check
        sprite[i].x = math.clamp(sprite[i].x, 16, map.x*16 - 16)
        sprite[i].y = math.clamp(sprite[i].y, 16, map.y*16 - 16)
        --Makes sure nothing can go off the map.
        --Please, use walls on all sides regardless in maps!
        
        --Done to all characters
    end
end


function gameDraw()
    for i = 1,table.getn(sprite) do
        animation.draw(i)
    end
end

function gameKey(key)
    if key == control['jump'] then
        if down('jump') and sprite[1].block.s and sprite[1].anim ~= 'hfall' then
            sound.play('tero', 'njump')
            sprite[1].vy = -1
        end
        --Let Klonoa jump
    end
end
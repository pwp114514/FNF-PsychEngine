function wd(r, qp)
    if qp == nil then
        qp = "%s";
    end
    local t={};
    for rt in string.gmatch(r, "([^"..qp.."]+)") do
    table.insert(t, rt);
    end
    return t;
end

windowOGPosition = {
315,
180
} --����Ϊ����Ĭ�ϴ���λ��
--��һ��315Ϊx
--�ڶ���180Ϊy

--event value12ʾ��
--[[

value1��x��Ϊx�ı� y��Ϊy

value2��һ����λ�� �ڶ�����ʱ�� ��������䷽ʽ

����

value1:x

value2:315,3,"quadInOut"

�򴰿ڻ���3�����quadInOut�Ĳ��䷽ʽ�ƶ���������315

                                                        --Niko_matthew
                                                                                                      
]]
function onCreate()
time = 0
makeLuaSprite('windowPosition','',windowOGPosition[1],windowOGPosition[2])
end

function onEvent(name, value1, value2)
if name == 'window xy' then
  if value1 == 'x' then
    time = time + 1
    i = wd(value2,",");  
    doTweenX('XXX'..time,'windowPosition',i[1],i[2],'cubeOut')
  elseif value1 == 'y' then
    time = time + 1
    i = wd(value2,",");  
    doTweenY('YYY'..time,'windowPosition',i[1],i[2],'cubeOut')
        end
    end
end

function onUpdate()
setPropertyFromClass('openfl.Lib','application.window.x', getProperty('windowPosition.x'))
setPropertyFromClass('openfl.Lib','application.window.y', getProperty('windowPosition.y'))
end

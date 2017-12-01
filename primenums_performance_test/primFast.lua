MAX=arg[1]
ARR={}
FINAL={}
for n=1,MAX do ARR[n]=n end

for k,v in ipairs(ARR) do
	if v>1 then
		POCET=math.floor(MAX/v)
		if POCET>=v then
			for i=v,POCET do
				POZICE=v*i
				ARR[POZICE]=0
			end
		end
	else
		ARR[v]=0
	end
	if ARR[v]>1 then
		table.insert(FINAL,ARR[v])
	end
end

print(table.unpack(FINAL))
--for k,v in ipairs(FINAL) do print(v) end

from collections import defaultdict

class FileWriter:

    def __init__(self):
        self.CurrentFile = 'converted'
        self.indentation = 0
        

    def writeHeader(self):
        with open(self.CurrentFile+".py", "w") as file:
            sentences = ["import sys \nimport os\nsys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))  # Adjust as necessary\nfrom Program import Program\n\n",f"class {self.CurrentFile}(Program):\n","\n"]
            for s in sentences:
                file.write(s)
    
    
    def constructor(self,addressMap):
        self.indentation=1
        if len(addressMap)!=0:
            element=max(addressMap,key=lambda element:(element[2],element[3]))
            variable,dataName,offset,totalLength,length,pic=element
        else:
            offset=0
            totalLength=0
        with open(self.CurrentFile+".py", "a+") as file:
            file.write(('\t' * self.indentation) +"def __init__(self):\n")
            file.write(('\t' * (self.indentation+1)) +f"super().__init__({offset+totalLength})"+"\n")
            file.write("\n")

    def writeComments(self,comments):
        self.indentation=0
        with open(self.CurrentFile+".py", "a+") as file:
            if len(comments)>0:
                file.write(('\t' * self.indentation) +"# Comments from source COBOL File:\n")
                for comment in comments:
                    file.write(('\t' * (self.indentation+1)) +f"# Line {comment[1]}: {comment[0]}\n")
            file.write("\n")
    
    def intializer(self,variableMap):
        self.indentation=1
        with open(self.CurrentFile+".py", "a+") as file:
            # file.write(('\t' * self.indentation) +"def unstring(input_str, delimiter, *variables):\n")
            # file.write('\t\t' +"parts = input_str.split(delimiter)\n"+
            #            '\t\t' +"result = []\n"+
            #            '\t\t' +"for i in range(min(len(parts), len(variables))):\n"+
            #            '\t\t\t' +"result.append(parts[i])\n"+
            #            '\t\t' +"result.extend([''] * (len(variables) - len(result)))\n"+
            #            '\t\t' +"return tuple(result)\n")
                       
            
            file.write(('\t' * self.indentation) +"def initialize(self):\n")
            self.indentation+=1
            for variable,Name in variableMap:
                if len(variable.children)==0:
                    if variable.value is not None:
                        
                        parentOccurs = []
                        for parent in variable.parents:
                            if parent.occurs > 1:
                                parentOccurs.append(parent.occurs)
                        if (variable.occurs!=1):
                            parentOccurs.append(variable.occurs)
                        if len(parentOccurs)!=0:
                            le = len(parentOccurs)
                            indexes=''
                            for i in range(le):
                                file.write(('\t' * self.indentation) +f"for idx{i+1} in range(0,{parentOccurs[i]}):\n")
                                indexes+=("idx"+str(i+1)+',')
                                self.indentation+=1
                            if variable.picInfo[-1]=='decimal' :
                                file.write(('\t' * self.indentation) +f'self.set{Name}({indexes}{float(variable.value)},False)'+'\n')
                            elif variable.picInfo[-1]=='integer' :
                                file.write(('\t' * self.indentation) +f'self.set{Name}({indexes}{int(variable.value)},False)'+'\n')
                            elif variable.picInfo[-1]=="alphaNumericEdited":
                                file.write(('\t' * self.indentation) +f'self.set{Name}({indexes}{variable.value})'+'\n')
                            self.indentation-=le
                        else:
                            # print(variable,Name,variable.picInfo,"intializer")
                            if variable.picInfo[-1]=='decimal' :
                                file.write(('\t' * self.indentation) +f'self.set{Name}({float(variable.value)},False)'+'\n')
                                # print(('\t' * self.indentation) +f'self.set{Name}({float(variable.value)},False)'+'\n')
                            elif variable.picInfo[-1]=='integer' :
                                file.write(('\t' * self.indentation) +f'self.set{Name}({int(variable.value)},False)'+'\n')
                                # print(('\t' * self.indentation) +f'self.set{Name}({int(variable.value)},False)'+'\n')
                            elif variable.picInfo[-1]=="alphaNumericEdited":
                                file.write(('\t' * self.indentation) +f'self.set{Name}({variable.value})'+'\n')
            file.write(('\t' * self.indentation) +"return\n")
            self.indentation-=1


                            
    

                        

            
    def writeGetterAndSetter(self,addressMap):
        self.indentation=1
        variableToName=[]
        nameMap = defaultdict(int)
        for element in addressMap:
            variable,dataName,offset,totalLength,length,pic=element
            variableCount = nameMap.get(dataName)
            hashval = ''
            if variableCount is not None:
                hashval = str(variableCount)
                nameMap[dataName]+=1
                dataName+=("_"+hashval)
            else:
                nameMap[dataName]+=1
            variableToName.append([variable,dataName])
            parentOccurs = []
            for parent in variable.parents:
                if parent.occurs > 1:
                    parentOccurs.append(parent.length)
            if (variable.occurs!=1):
                parentOccurs.append(variable.length)
            with open(self.CurrentFile+".py", "a+") as file:
                offset = str(offset)
                indexes = ''
                for i in range(0,len(parentOccurs)):
                    offset+=("+ idx"+str(i+1)+f"*{str(parentOccurs[i])}")
                    indexes+=(",idx"+str(i+1))
                if pic[1] == "decimal":
                    if len(variable.level88Vars)==0:
                        file.write(('\t' * self.indentation) + f"def get{dataName}(self{indexes}):" + '\n')
                        file.write(('\t' * (self.indentation + 1)) + f"return super().getAsFloat({offset}, {length}, '{pic[0][0]}', {pic[0][2]}, {variable.isSignSeparate}, {variable.isSignLeading})" + '\n')
                        file.write('\n')
                        file.write(('\t' * self.indentation) + f"def set{dataName}(self{indexes}, value, isRounded=False):" + '\n')
                        file.write(('\t' * (self.indentation + 1)) + f"return super().setAsFloat({offset}, {length}, value, isRounded, '{pic[0][0]}', {pic[0][2]}, {variable.isSignSeparate}, {variable.isSignLeading})" + '\n')
                        file.write('\n')
                    else:
                        file.write(('\t' * self.indentation) + f"def get{dataName}(self{indexes}):" + '\n')
                        file.write(('\t' * (self.indentation + 1)) + f"return super().getAsFloat({offset}, {length}, '{pic[0][0]}', {pic[0][2]}, {variable.isSignSeparate}, {variable.isSignLeading})" + '\n\n')
                        for condition in variable.level88Vars:
                            variableCount = nameMap.get(condition[0].dataName)
                            hashval = ''
                            dataName1 = condition[0].dataName
                            if variableCount is not None:
                                hashval = str(variableCount)
                                nameMap[dataName1]+=1
                                dataName1+=("_"+hashval)
                            else:
                                nameMap[dataName1]+=1
                            variableToName.append([condition[0],dataName1])
                            file.write(('\t' * (self.indentation)) + f"def get{dataName1}(self):" + '\n')
                            cond=''
                            for x in condition[1]:
                                cond+=f'(val >= {float(x[0])} and val <= {float(x[1])}) or '
                            for x in condition[2]:
                                x=x.replace(',','')
                                cond+=f'(val == {float(x)}) or '
                            cond=cond[:-3]
                            file.write(('\t' * (self.indentation + 1)) + f"val = self.get{dataName}()" + '\n')
                            file.write(('\t' * (self.indentation + 1)) + f"return True if ({cond}) else False" + '\n\n')
                        # file.write(('\t' * (self.indentation + 1)) + 'return val'+'\n')
                        
                        file.write(('\t' * self.indentation) + f"def set{dataName}(self{indexes}, value, isRounded=False):" + '\n')
                        file.write(('\t' * (self.indentation + 1)) + f"return super().setAsFloat({offset}, {length}, value, isRounded, '{pic[0][0]}', {pic[0][2]}, {variable.isSignSeparate}, {variable.isSignLeading})" + '\n')
                        file.write('\n')
                    file.write(('\t' * self.indentation) + f"def getDisplay{dataName}(self{indexes}):" + '\n')
                    file.write(('\t' * (self.indentation + 1)) + f"return super().getAsDisplayFloat({offset}, {length}, '{pic[0][0]}', {pic[0][2]}, {variable.isSignSeparate}, {variable.isSignLeading})" + '\n')
                    file.write('\n')


                if pic[1] == "integer":
                    if len(variable.level88Vars)==0:
                        file.write(('\t' * self.indentation) + f"def get{dataName}(self{indexes}):" + '\n')
                        file.write(('\t' * (self.indentation + 1)) + f"return super().getAsInt({offset}, {length}, {pic[0][2]}, {variable.isSignSeparate}, {variable.isSignLeading})" + '\n')
                        file.write('\n')
                        file.write(('\t' * self.indentation) + f"def set{dataName}(self{indexes}, value, isRounded=False):" + '\n')
                        file.write(('\t' * (self.indentation + 1)) + f"return super().setAsInt({offset}, {length}, value, isRounded, {pic[0][2]}, {variable.isSignSeparate}, {variable.isSignLeading})" + '\n')
                        file.write('\n')
                    else:
                        file.write(('\t' * self.indentation) + f"def get{dataName}(self{indexes}):" + '\n')
                        print(pic)
                        file.write(('\t' * (self.indentation + 1)) + f"return super().getAsInt({offset}, {length}, {pic[0][2]}, {variable.isSignSeparate}, {variable.isSignLeading})" + '\n\n')
                        for condition in variable.level88Vars:
                            variableCount = nameMap.get(condition[0].dataName)
                            hashval = ''
                            dataName1 = condition[0].dataName
                            if variableCount is not None:
                                hashval = str(variableCount)
                                nameMap[dataName1]+=1
                                dataName1+=("_"+hashval)
                            else:
                                nameMap[dataName1]+=1
                            variableToName.append([condition[0],dataName1])
                            file.write(('\t' * (self.indentation)) + f"def get{dataName1}(self):" + '\n')
                            cond=''
                            for x in condition[1]:
                                cond+=f'(val >= {int(x[0])} and val <= {int(x[1])}) or '
                            for x in condition[2]:
                                x=x.replace(',','')
                                cond+=f'(val == {int(x)}) or '
                            cond=cond[:-3]
                            file.write(('\t' * (self.indentation + 1)) + f"val = self.get{dataName}()" + '\n')
                            file.write(('\t' * (self.indentation + 1)) + f"return True if ({cond}) else False" + '\n\n')
                        # file.write(('\t' * (self.indentation + 1)) + 'return val'+'\n')
                        
                        file.write(('\t' * self.indentation) + f"def set{dataName}(self{indexes}, value, isRounded=False):" + '\n')
                        file.write(('\t' * (self.indentation + 1)) + f"return super().setAsInt({offset}, {length}, value, isRounded, {pic[0][2]}, {variable.isSignSeparate}, {variable.isSignLeading})" + '\n')
                        file.write('\n')
                    file.write(('\t' * self.indentation) + f"def getDisplay{dataName}(self{indexes}):" + '\n')
                    file.write(('\t' * (self.indentation + 1)) + f"return super().getAsDisplayInt({offset}, {length}, {pic[0][2]}, {variable.isSignSeparate}, {variable.isSignLeading})" + '\n')
                    file.write('\n')


                if pic[1] == "alphaNumericEdited":
                    if len(variable.level88Vars)==0:
                        file.write(('\t' * self.indentation) + f"def get{dataName}(self{indexes}):" + '\n')
                        file.write(('\t' * (self.indentation + 1)) + f"return super().getAsString({offset}, {length})" + '\n')
                        file.write('\n')
                        file.write(('\t' * self.indentation) + f"def set{dataName}(self{indexes}, value):" + '\n')
                        file.write(('\t' * (self.indentation + 1)) + f"return super().setAsString({offset}, {length}, value)" + '\n')
                        file.write('\n')
                    else:
                        file.write(('\t' * self.indentation) + f"def get{dataName}(self{indexes}):" + '\n')
                        print(pic)
                        file.write(('\t' * (self.indentation + 1)) + f"return super().getAsString({offset}, {length})" + '\n\n')
                        for condition in variable.level88Vars:
                            variableCount = nameMap.get(condition[0].dataName)
                            hashval = ''
                            dataName1 = condition[0].dataName
                            if variableCount is not None:
                                hashval = str(variableCount)
                                nameMap[dataName1]+=1
                                dataName1+=("_"+hashval)
                            else:
                                nameMap[dataName1]+=1
                            variableToName.append([condition[0],dataName1])
                            file.write(('\t' * (self.indentation)) + f"def get{dataName1}(self):" + '\n')
                            cond=''
                            for x in condition[1]:
                                cond+=f'(val >= {x[0]} and val <= {x[1]}) or '
                            for x in condition[2]:
                                x=x.replace(',','')
                                cond+=f'(val == {x}) or '
                            cond=cond[:-3]
                            file.write(('\t' * (self.indentation + 1)) + f"val = self.get{dataName}()" + '\n')
                            file.write(('\t' * (self.indentation + 1)) + f"return True if ({cond}) else False" + '\n\n')
                        # file.write(('\t' * (self.indentation + 1)) + 'return val'+'\n')
                        
                        file.write(('\t' * self.indentation) + f"def set{dataName}(self{indexes}, value):" + '\n')
                        file.write(('\t' * (self.indentation + 1)) + f"return super().setAsString({offset}, {length}, value)" + '\n')
                        file.write('\n')
                    file.write(('\t' * self.indentation) + f"def getDisplay{dataName}(self{indexes}):" + '\n')
                    file.write(('\t' * (self.indentation + 1)) + f"return super().getAsString({offset}, {length})" + '\n')
                    file.write('\n')
                        
                if pic[1]=='':
                    file.write(('\t' * self.indentation) + f"def get{dataName}(self{indexes}):" + '\n')
                    file.write(('\t' * (self.indentation + 1)) + f"return super().getAsString({offset}, {length})" + '\n')
                    file.write('\n')
                    file.write(('\t' * self.indentation) + f"def set{dataName}(self{indexes}, value):" + '\n')
                    file.write(('\t' * (self.indentation + 1)) + f"return super().setAsString({offset}, {length}, value)" + '\n')
                    file.write('\n')
                
                    file.write(('\t' * self.indentation) + f"def getDisplay{dataName}(self{indexes}):" + '\n')
                    file.write(('\t' * (self.indentation + 1)) + f"return super().getAsString({offset}, {length})" + '\n')
                    file.write('\n')

        return variableToName
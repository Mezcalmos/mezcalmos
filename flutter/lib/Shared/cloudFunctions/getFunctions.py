import os
import sys
import json
import re

onlyFunctionImports = {}
fileImports = {}
functionNamesGroup1 = []
functionNamesGroup2 = {}
uniqueTypes = {}
models = {}
errors = {}

types = {"number": "num", "string": "String", "boolean": "bool"}

def getUniqueTypes():

  for folder, dirs, files in os.walk("./shared/models"):
    if "Taxi" in folder:
      continue
    for file in files:
      if file == '.DS_Store' or "Keys" in file or "Chat" in file:
        continue
      # print(file)
      fullpath = os.path.join(folder, file)
      with open(fullpath, 'r') as f:
        for line in f:
          if "otification" in line or "extends" in line or "//" in line or "Server" in line:
            continue
          if "enum " in line:
            typeName = line.split("enum ")[1].strip()[:-1].strip()
            if typeName not in uniqueTypes:
              # print("===", typeName)
              uniqueTypes[typeName] = True
          if "interface " in line:
            typeName = line.split("interface ")[1].strip()[:-1].strip()
            if typeName not in uniqueTypes:
              # print("===", typeName)
              uniqueTypes[typeName] = True

def searchForModel(search):  
  
  typeDictionary = {"values":{}}
  found = False
  for folder, dirs, files in os.walk("./"):
    for file in files:
      if file == '.DS_Store':
        continue
      fullpath = os.path.join(folder, file)
      search1 = search
      if "Array" in search:
        matches = re.compile(r'\<(.*?)\>').findall(search)
        if len(matches) >= 1:
          search1 = matches[0]
      with open(fullpath, 'r') as f:
        for line in f:
          if "enum "+search1+" " in line or "enum "+search1+"{" in line:
            typeDictionary["type"] = "enum"
            found = True
          if "interface "+search1+" " in line or "interface "+search1+"{" in line:
            typeDictionary["type"] = "interface"
            found = True
          if found:
            if ":" in line:
              v = line.split(":")
              typeDictionary["values"][v[0].strip()] = v[1].strip().replace(",","").replace(";","") 
              if typeDictionary["values"][v[0].strip()] not in ["string", "number", "boolean", "JSON"]:
                # print("===", typeDictionary["values"][v[0].strip()])
                if "Error" in typeDictionary["values"][v[0].strip()]:
                  errors[typeDictionary["values"][v[0].strip()]] = True
            if "=" in line:
              v = line.split("=")
              typeDictionary["values"][v[0].strip()] = v[1].strip().replace(",","").replace("\"","").replace(";","")                 
            if("}" in line):
              # models[search] = typeDictionary
              # print("==>", search1)
              models[search1] = typeDictionary
              return
  print("🚫🚫🚫🚫🚫 model not found")
  print(search)
  
  print()
  sys.exit()

def getFileName(corresponding):
  pre = corresponding.split("(")[0]
  if "." in pre:
    return fileImports[pre.split(".")[0]]
  else:
    return onlyFunctionImports[pre]

def getArguments(corresponding):
  # print(corresponding)
  fileName = getFileName(corresponding)
  searchFor = corresponding.split("(")[0]+"("
  if "." in corresponding.split("(")[0]:
    searchFor = corresponding.split("(")[0].split(".")[1]+"("
  if "data" in corresponding:
    with open(fileName+".ts", 'r') as f:
      for line in f:
        if searchFor in line:
          interface = line.split(")")[0].split("(")[1].split(",")[1].split(":")[1].strip()
          with open(fileName+".ts", 'r') as f2:
            found = False
            arguments = {}
            for line2 in f2:
              if interface in line2 and "interface" in line2:
                found = True
              if found:
                if ":" in line2:
                  v = line2.split(":")
                  # if 'Record' not in v[1]:
                  #   matches = re.compile(r'\<(.*?)\>').findall(v[1])
                  #   if len(matches) >= 1:
                  #     v[1] = matches[0]
                  arguments[v[0].strip()] = v[1].strip().replace(",","").replace(";","")
                  uniqueTypes[v[1].strip().replace(",","").replace(";","")] = True
                if("}" in line2):
                  return arguments
          print("🚫🚫🚫🚫🚫 interface not found in file")
          print(interface)
          print(fileName)
          print()
          sys.exit()
    print("🚫🚫🚫🚫🚫 function not found in file")
    print(searchFor)
    print(fileName)
    print()
    sys.exit()
 
def getReturnType(corresponding):
  # print(corresponding)
  fileName = getFileName(corresponding)
  searchFor = corresponding.split("(")[0]+"("
  if "." in corresponding.split("(")[0]:
    searchFor = corresponding.split("(")[0].split(".")[1]+"("
  if "data" in corresponding:
    with open(fileName+".ts", 'r') as f:
      for line in f:
        if searchFor in line:
          returnType = line.split(")")[1].split("{")[0].strip()
          # @sanchit find return type checkoutResponse
          if returnType:
            returnType = returnType.split(":")[1].strip()
            if "Promise" in returnType:
              returnType = returnType.split("<")[1].split(">")[0]
            # print(returnType)
            if "void" in returnType:
              returnType = ""
            # returnType = "CheckoutResponse"
          if returnType:
            uniqueTypes[returnType] = True
            return returnType
          return None


def getCorrespondingFnName(functionGroupName, line, authenticated):
  functionName = line.strip().split(":")[0]
  fullFunctionName = functionGroupName+"-"+functionName
  functionNamesGroup2[fullFunctionName] = {}
  functionNamesGroup2[fullFunctionName]["authenticated"] = authenticated
  corresponding = line.split("=>")[1].strip()
  if corresponding[-1] == ",":
    corresponding = corresponding[:-2]
  # functionNamesGroup2[functionGroupName][functionName]["functionName"] = corresponding.split("(")[0][:-1]
  functionNamesGroup2[fullFunctionName]["arguments"] = getArguments(corresponding)
  functionNamesGroup2[fullFunctionName]["returnType"] = getReturnType(corresponding)
  # print(functionNamesGroup2[fullFunctionName]["returnType"])


def extractFunctionNamesGroupAsDictionary():
  for fn in functionNamesGroup1:
    functionGroupName = fn[fn.index("const")+5:fn.index("=")].strip()
    for line in fn.splitlines():
      if ":" in line:
        if "function" in line:
          getCorrespondingFnName(functionGroupName, line, False)
          # break
        if "authenticatedCall" in line:
          getCorrespondingFnName(functionGroupName, line, True)
    # break
    
exportConstStarted = False
exportConstValue = ""

def extractFunctionNamesGroupAsString(line):
  global exportConstStarted
  global exportConstValue
  if exportConstStarted == True:
    if "//" not in line:
      exportConstValue += line
    if "}" in line:
      exportConstStarted = False
      functionNamesGroup1.append(exportConstValue)
  if "export const" in line and "//" not in line:
    exportConstStarted = True
    exportConstValue = line   


# fills the following
#  onlyFunctionImports = {} like import { createNewRestaurant } from "./restaurant/createNewRestaurant";
# fileImports = {} import * as restaurantStatusChange from './restaurant/adminStatusChanges'
def extractImports(line):
  if "import" in line and "//" not in line:
    bits = line.split("from")
    bits2 = bits[0].split(' ')
    # print(bits2)
    if "{" in bits2:
      for x in bits2[bits2.index("{")+1:bits2.index("}")]:
        onlyFunctionImports[x.replace(",","")] = bits[-1].replace(";","").replace("\n","").replace("'","").replace("\"","").strip()
    if "as" in bits2:
      fileImports[bits2[-2]] = bits[-1].replace("\n","").replace("\n","").replace("'","").replace("\"","").strip()


def printDartFormatDeclaration(name, typ):
  nullable = ""
  if "?" in name:
    nullable = "?"

  prefix = typ
  if "null" in typ:
    nullable = "?"
    prefix = prefix.strip()[:-4].strip()[:-1].strip()
  if "undefined" in typ:
    nullable = "?"
    prefix = prefix.strip()[:-9].strip()[:-1].strip()
  if prefix in types:
    prefix = types[prefix]
  # if "Array" in prefix:
  prefix = prefix.replace("Array", "List")
  prefix = prefix.replace("Record", "Map")
  prefix = prefix.replace("any", "dynamic")
  if "<" in prefix:
    prefix1 = prefix.split("<")[1].split(">")[0].strip()
    if " " in prefix1:
      if prefix1.split()[0] in types:
        prefix = prefix.replace(prefix1.split()[0], types[prefix1.split()[0]])
      if prefix1.split()[1] in types:
        prefix = prefix.replace(prefix1.split()[1], types[prefix1.split()[1]])
      prefix = prefix.replace(" ", ", ")
    elif prefix1 in types:
      prefix = prefix.replace(prefix1, types[prefix1])
  prefix = prefix.replace("string", "String")
  return "  "+prefix+nullable+" "+name.replace("?","")+";"

def printDartFormatClassInit(clas, instances):
  if "Response" in clas:
    str = "  "+clas+"(";
    for i in instances:
      str += "this."+i.replace("?","")+", "
    return str[:-2]+");"
    
  str = "  "+clas+"({\n    "
  for i in instances:
    if "?" not in i:
      str += "required "
    str += "this."+i.replace("?","")+", "
  return str[:-2]+"});"

def printDartFormatEnum(key, values): 
  str = "enum "+key+" { "
  for v in values:
    str += v+", "
  str = str[:-2]+" }\n"

  converter = '''extension Parse####ToString on #### {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringTo#### on String {
  #### to####() {
    return ####.values.firstWhere(
        (#### ****) =>
            ****.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}
'''
  name = key[0].lower() + key[1:]
  converter = converter.replace("####",key)
  converter = converter.replace("****",name)
  if key == "Language":
    converter = converter.replace("str[0].toLowerCase() + str.substring(1)", "str.toLowerCase()")
  return str+converter+"\n\n"

def printDartFormatFunction(key, value):
  str = "  static Future<void> "+key.replace("-","_")+"(\n"
  if value["returnType"] != None:
    str = str.replace("void", value["returnType"])
  if value["arguments"] != None:
    str += "      {"
    for v in value["arguments"]:
      toAdd = '''required type name,
      '''
      if(v[-1] == "?"): 
        toAdd = toAdd.replace("required ","")
      toAdd = toAdd.replace("name", v.replace("?",""))
      prefix = value["arguments"][v]
      if "Array" in prefix:
        prefix = prefix.replace("Array","List")
        matches = re.compile(r'\<(.*?)\>').findall(key)
        if len(matches) >= 1:
          if matches[0] in types:
            prefix = "List<"+types[prefix]+">"
      if prefix in types:
        prefix = types[prefix]
      if(v[-1] == "?"): 
        prefix += "?"
      if "Record" in prefix:
        prefix = prefix.replace("Record","Map")
        prefix = prefix.replace(" ",",")
        arr = prefix.split("<")[1].split(">")[0].split(",")
        if arr[0] in types:
          prefix = prefix.replace(arr[0], types[arr[0]])
        elif models[arr[0]]["type"] == "enum":
          prefix = prefix.replace(arr[0], "String")
        if arr[1] in types:
          prefix = prefix.replace(arr[1], types[arr[1]])
        elif models[arr[1]]["type"] == "enum":
          prefix = prefix.replace(arr[1], "String")
      # print(prefix)
      
        
      toAdd = toAdd.replace("type", prefix)
      toAdd = toAdd.replace("JSON", "Map<String, dynamic>")
      str += toAdd
    str = str[:-8]+"}"
  str += "  ) async {\n"
  body = "    return "
  if value["returnType"] != None:
    body += value["returnType"]
    body += ".fromFirebaseFormattedJson("
  body += "await callCloudFunction("
  body +='''
      functionName: "fnxxx",
      parameters: <String, dynamic>{});
  }'''
  if value["returnType"] != None:
    body = body.replace("parameters: <String, dynamic>{});","parameters: <String, dynamic>{}));")
  body = body.replace("fnxxx", key)
  params = "<String, dynamic>{\n        "
  if value["arguments"] != None:
    for v1 in value["arguments"]:
      # v = v1.replace("?","")
      v = v1.replace("?","")
      # print("-->", value["arguments"][v1])
      val = value["arguments"][v1]
      if "Array" in val:
        matches = re.compile(r'\<(.*?)\>').findall(val)
        if len(matches) >= 1:
          val = matches[0]
      if val in models and models[val]["type"] == "enum":
        p2 = "\""+v+"\""+":"+v
        if "Array" in value["arguments"][v1]:
          matches = re.compile(r'\<(.*?)\>').findall(value["arguments"][v1])
          print("=>")
          print(value["arguments"][v1])
          if len(matches) >= 1:
            p2 = p2+'''?.fold<List<dynamic>>([],
              (List<dynamic> value, '''+ matches[0] +''' element) {
            value.add(element.toFirebaseFormattedJson());
            return value;
          }),\n        '''
        else:
          p2 = p2+".toFirebaseFormatString(),"+"\n"+"        "
        if v1[-1] == "?":
          p2 = p2.replace(".toFir","?.toFir")
        params += p2
      elif val in models and models[val]["type"] == "interface":
        p2 = "\""+v+"\""+":"+v
        # print("-->", value["arguments"][v1])
        if "Array" in value["arguments"][v1]:
          matches = re.compile(r'\<(.*?)\>').findall(value["arguments"][v1])
          # print("=> ", value["arguments"][v1])
          if len(matches) >= 1:
            p2 = p2+'''.fold<List<dynamic>>([],
              (List<dynamic> value, '''+ matches[0] +''' element) {
            value.add(element.toFirebaseFormattedJson());
            return value;
          }),\n        '''
            if v1[-1] == "?":
              p2 = p2.replace(".fold","?.fold")
        else:
          p2 = p2+".toFirebaseFormattedJson(),"+"\n"+"        "
          if v1[-1] == "?":
            p2 = p2.replace(".toFir","?.toFir")
        params += p2
      # elif value["arguments"][v1] == "JSON":
      #   params += "\""+v+"\""+":json.encode("+v+"),"+"\n"+"        "
      else:
        params += "\""+v+"\""+": "+v+","+"\n"+"        "
      # params = params.replace("?","")
    body = body.replace("<String, dynamic>{}",params[:-2]+"}")

  return str+body+"\n\n"; 

def getModels():
  toWriteModel = ""
  for key in models:
    print(key)
    if "Array" in key:
      continue
      # matches = re.compile(r'\<(.*?)\>').findall(key)
      # print("=>")
      # print(key)
      # if len(matches) >= 1:
      #   models[matches[0]] = models[key]
      #   key = matches[0]
    if models[key]["type"] == "interface":
      toWriteModel += "class "+key+" {"+"\n"
      for v in models[key]["values"]:
        # print(models[key]["values"][v])
        toWriteModel +=  printDartFormatDeclaration(v, models[key]["values"][v])+"\n"
      toWriteModel += printDartFormatClassInit(key, models[key]["values"])+"\n"
      if key == "Schedule":
        toWriteModel += "\n}\n"
        continue
      toWriteModel +=   '''Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      '''
      for v in models[key]["values"]:
        toWriteModel +=  "\""+v.replace("?","")+"\": "
        if models[key]["values"][v] == "Language" :
          toWriteModel += v+".toFirebaseFormatString(),\n      "
        else:
          toWriteModel += v.replace("?","")+",\n      "
      toWriteModel = toWriteModel[:-2]
      toWriteModel +=  "};\n  }\n"
      if "Response" in key:
        # print(key)
        toWriteModel += "factory "+key+".fromFirebaseFormattedJson(json) { "
        toWriteModel += "\n   return "+key+"("
        for v in models[key]["values"]:
          toWriteModel += '''json["'''+v.replace("?","")+'''"], '''
          # print(models[key]["values"][v])
          if models[key]["values"][v] in models:
            if models[models[key]["values"][v]]["type"] == "enum":
              toWriteModel = toWriteModel[:-2]
              toWriteModel += "?.toString().to" + models[key]["values"][v] + "(), "
        toWriteModel = toWriteModel[:-2]
        toWriteModel += ''');
  }'''
      toWriteModel +=  "\n}\n\n"
    if models[key]["type"] == "enum":
      toWriteModel +=  printDartFormatEnum(key, models[key]["values"])
  return toWriteModel

def getIndex():
  toWriteIndex = '''import 'package:cloud_functions/cloud_functions.dart';
import 'dart:convert';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
class CloudFunctions {
  static Future<dynamic> callCloudFunction(
      {required String functionName, Map<String, dynamic>? parameters}) async {
    final Map<String, dynamic> finalParams = <String, dynamic>{
      'versionNumber': '0.0.0'
    };
    finalParams.addAll(parameters ?? <String, dynamic>{});
    final HttpsCallableResult<dynamic> response = await FirebaseFunctions.instance
        .httpsCallable(functionName)
        .call(finalParams);
    return response.data;
  }

'''
  


  for key in functionNamesGroup2:
    toWriteIndex += printDartFormatFunction(key, functionNamesGroup2[key])

  toWriteIndex += "}"
  return toWriteIndex


if __name__ == "__main__":
  os.chdir('../../../../functions/src')
  with open('./index.ts', 'r') as f:
    for line in f:
      extractImports(line)
      extractFunctionNamesGroupAsString(line)
  extractFunctionNamesGroupAsDictionary()
  uniqueTypes["NotificationInfo"] = True
  uniqueTypes["Language"] = True
  getUniqueTypes()
  for key in uniqueTypes:
    # print("-->", key)
    matches = re.compile(r'\<(.*?)\>').findall(key)
  
    if len(matches) >= 1:
      print("=>")
      print(key)
      if matches[0] in ["string", "number", "boolean", "JSON"]:
        continue
    if key not in ["string", "number", "boolean", "JSON"] and "Record" not in key: #and "Array" not in key:
      # models[key] = 
      searchForModel(key)
  for key in errors:
    if "Error" in key: #and "Array" not in key:
      # print("-->", key)
      # models[key] = 
      searchForModel(key)
  os.chdir('../../flutter/lib/Shared/cloudFunctions')

  f = open("index.dart", "w")
  f.write(getIndex())
  f.close()
  f = open("model.dart", "w")
  f.write(getModels())
  f.close()
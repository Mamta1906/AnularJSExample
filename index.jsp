<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US">
<head>
<title>Insert title here</title>
<script src="http:\\ajax.googleapis.com\ajax\libs\angularjs\1.6.4\angular.min.js"></script>
<style>
input.ng-valid{
background-color:lightblue;
}
</style>
<script>
var myApp123=angular.module("myApp",[]);
myApp123.controller("myCtrl",function($scope){
	$scope.sometext="abc123@gmail.com";
	$scope.names=["A1","A2","A3","A4","A5"];
	$scope.employee=[{"Name":"Vishnu","Company":"UTL"},{"Name":"Swathi","Company":"CTS"},{"Name":"ABC","Company":"UTL"}];
	$scope.deleteFromNames=function(somevalue){
		//var index=$scope.names.indexOf(somevalue);
		$scope.names.splice(somevalue,1);
		//alert($scope.names);
	};
	$scope.pushToNames=function(){
		
		//var index=$scope.names.indexOf(somevalue);
		$scope.names.push($scope.pushNames);
		//alert($scope.names);
	};
	$scope.orderByMe=function(x){
		$scope.myOrderBy=x;
	}
});
myApp123.directive("ngMyDirective",function(){
	return{
		restrict:"A",
		template:"<h1>My New Directive"
	};
});
</script>
</head>
<body>
<form ng-app="myApp" name="myForm" ng-controller="myCtrl">
<input type="text" name="myName" ng-model="yourName" value="0" required>
<input type="email" name="myEmail" ng-model="text">
<input type="text" name="someText" ng-model="sometext">
<input type="text" name="pushNames" ng-model="pushNames"><button ng-click="pushToNames()">Add</button>
<h1 style="color:green">Square::  {{yourName*yourName}} {{sometext}}</h1>
<p>Changed:{{myForm.myName.$dirty}}</p>
<p>Focused:{{myForm.myName.$touched}}</p>
<span ng-show="myForm.myEmail.$error.email">Not a valid e-mail address </span>
<span>
<ul >
<li ng-repeat="x in names | filter:pushNames" >{{x}}  <span ng-click="deleteFromNames($index)" style="color:red;cursor:pointer;">X</span></li>
</ul>
<table>
<tr>
<th ng-click="orderByMe('Name')">Name</th>
<th ng-click="orderByMe('Company')">Company</th>
</tr>
<tr ng-repeat="x in employee | orderBy:myOrderBy">
<td>{{x.Name}}</td> <td>{{x.Company}}</td>
</tr>
</table>
<span ng-my-directive></span>
</span>
</form>
</body>
</html>
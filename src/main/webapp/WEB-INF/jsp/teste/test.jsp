<div class="container">
	<h1>Hello Counter</h1>
	
	<form name="myForm">  
        <span ng-show="myForm.$invalid">
             Found erros in the form!
         </span>
         <input type="text" ng-model="name" name="Name" value="Your Name" required/>
         <button ng-disabled="myForm.$invalid"/>Save</button>
     </form>
 
</div>

<js:import javascript="/js/test.js"></js:import>

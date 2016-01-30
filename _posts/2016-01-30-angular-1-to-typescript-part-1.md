---
layout: post
title:  "Moving Angular 1 to Typescript"
date:   2016-01-30 13:58:00
categories: Javascript
tags:
- Javascript
- Typescript
- Angular
---
Typescript brings compile-time type checking resolving many headaches

## Why?

As you may know javascript is an interpreted language, and doens't have any sort of typechecking making for mega headaches :rage1: as your app gets bigger than even a few files.

## Enter Typescript

Google Search Trends for "Typescript"

![Typescript Google Search Trends Popularity](/images/typescript_popularity_google.png)

Typescript is maintained by Microsoft and is integral to their NodeJS maket strategy. Their entire Visual Studio online software is 
build in NodeJS which shows their commitment.

If you're writing angular code you either are, or probably should be following the [John Papa Angular Style Guide](https://github.com/johnpapa/angular-styleguide). 

With stats like these, you can't ignore it:

![John Pap Style Guide Github Stats](/images/john_pap_style_guide_stats.png)

In the next examples I'll show to convert each of these components

## Services 

### Angular 1

```javascript
(function() {
    'use strict';

    angular.module('myApp')
        .service('mySayHelloService', [
            '$log',
            sayHelloService]);

    function sayHelloService($log) {
        return {
            sayHello: sayHello
        };

        function sayHello() {
            $log.info('Hello!');
        }
    }
})();
```

### Typescript

```javascript
module myApp {
    'use strict';

    // Declare the interface by specifiying the parameters for each exposed object
    export interface ISayHelloService {
        sayHello ();
    }

    class SayHelloService implements ISayHelloService {
        // use the inject service to get the required providers statically
        static $inject = ['$log'];

        // Constructor will be called when the service is required
        constructor(private $log: ng.ILogService) {
            // Empty is normal, but you can initialize things here too
        }
        
        sayHello() {
            this.$log.info('Hello!');
        }
    }
    // Attach the provider to the angular module and reference the funciton to call 
    // when a new instance of this Service is required
    angular.module('MyApp')
        .service('mySayHelloService', SayHelloService);
}
```

## Factories

Very similar to Services except, like java, you have a static instance maker and pass that when registering the module  

Not including the factory version since it should be familiar to anyone using angular 1

### Typescript

```javascript
module myApp {
    'use strict';

    // Declare the interface by specifiying the parameters for each exposed object
    export interface ISayHelloFactory {
        sayHello ();
    }

    class SayHelloFactory implements ISayHelloFactory {
        // use the inject service to get the required providers statically
        static $inject = ['$log'];

        // Constructor will be called when the factory is required
        constructor(private $log: ng.ILogService) {
            // Empty is normal, but you can initialize things here too
        }
        
        // Can be named anything, must return new instance of the class
        // The parameters must also correspond to the order the constructor
        // and $inject call them (yes alot of boilerplate)
        static instance($log) {
            return new SayHelloFactory($log);
        }

        // Implement the required functions, no function pretext required
        sayHello() {
            this.$log.info('Hello!');
        }
    }
    // Attach the provider to the angular module and reference the function to call
    // when a new instance of this Factory is required
    angular.module('MyApp')
        .factory('mySayHelloFactory', SayHelloFactory.instance);
}
```

## Controllers

### Angular 1

```javascript
(function() {
    'use strict';

    angular.module('myApp')
        .controller('mySayHelloController', [
            'mySayHelloFactory',
            sayHelloController]);

    function sayHelloController(mySayHelloFactory) {
        return {
            sayHello: mySayHelloFactory.sayHello
        };
    }
})();
```

### Typescript

```javascript
module myApp {
    'use strict';

    class MySayHelloController {
        // use the inject service to get the required providers statically
        static $inject = ['mySayHelloFactory'];

        // Constructor will be called when the controller is required
        constructor(private mySayHelloFactory: ISayHelloFactory) {
            // Empty is normal, but you can initialize things here too
        }

        // This function is available aslong as you use the Controller As syntax
        sayHello() {
            return this.mySayHelloFactory.sayHello();
        }
    }
    // Attach the controller to the angular module. Constructor will be called when required
    angular.module('MyApp')
        .controller('mySayHelloController', MySayHelloController);
}
```



#Conclusion

Typescript is an incredible tool that you shouldn't ignore. It does take a fair amount of work to learn and convert your app but you WILL reap the benefits.

* Increase developer productivity

* Less Tests need to be written

* Fewer runtime exceptions due to typings issues

* Better communication between developers since typing takes care of interface disparities



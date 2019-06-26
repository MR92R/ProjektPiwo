
;;;======================================================
;;;   Automotive Expert System
;;;
;;;     This expert system diagnoses some simple
;;;     problems with a car.
;;;
;;;     CLIPS Version 6.3 Example
;;;
;;;     For use with the Auto Demo Example
;;;======================================================

;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list))
   
;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule determine-in-scotland ""

   (logical (start))

   =>

   (assert (UI-state (display StartQuestion)
                     (relation-asserted in-scotland)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule determine-double-wide ""

   (logical (in-scotland No))

   =>

   (assert (UI-state (display DoubleWideQuestion)
                     (relation-asserted double-wide)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule determine-mckenzie ""
  
   (logical (double-wide No))

   =>
   
   (assert (UI-state (display MckenzieQuestion)
                     (relation-asserted mckenzie)
                     (response No)
                     (valid-answers No Yes))))


(defrule determine-projects ""
   
   (logical (mckenzie No))

   =>

   (assert (UI-state (display ProjectsQuestion)
                     (relation-asserted projects)
                     (response No)
                     (valid-answers No Yes))))
                     
 (defrule determine-hockey ""
   
   (logical (projects No))

   =>

   (assert (UI-state (display HockeyQuestion)
                     (relation-asserted hockey)
                     (response No)
                     (valid-answers No Yes))))

 (defrule determine-stargate ""
   
   (logical (hockey No))

   =>

   (assert (UI-state (display StargateQuestion)
                     (relation-asserted stargate)
                     (response No)
                     (valid-answers No Yes))))
                    
 (defrule determine-hipster ""
   
   (logical (stargate No))

   =>

   (assert (UI-state (display HipsterQuestion)
                     (relation-asserted hipster)
                     (response No)
                     (valid-answers No Yes))))
                     
  (defrule determine-driver ""
   
   (logical (hipster No))

   =>

   (assert (UI-state (display DriverQuestion)
                     (relation-asserted driver)
                     (response No)
                     (valid-answers No Yes))))
                  
 (defrule determine-tailgate ""
   
   (logical (driver No))

   =>

   (assert (UI-state (display TailgateQuestion)
                     (relation-asserted tailgate)
                     (response No)
                     (valid-answers No Yes))))
  
  (defrule determine-beer-gut ""
   
   (logical (tailgate Yes))

   =>

   (assert (UI-state (display BeerGutQuestion)
                     (relation-asserted beer-gut)
                     (response No)
                     (valid-answers No Yes))))
                     
    (defrule determine-guiness ""
   
   (logical (tailgate No))

   =>

   (assert (UI-state (display GuinessQuestion)
                     (relation-asserted guiness)
                     (response No)
                     (valid-answers No Yes))))

 (defrule determine-summer ""
   
   (logical (guiness No))

   =>

   (assert (UI-state (display SummerQuestion)
                     (relation-asserted summer)
                     (response No)
                     (valid-answers No Yes))))
                     
  (defrule determine-paying ""
   
   (logical (summer Yes))

   =>

   (assert (UI-state (display PayingQuestion)
                     (relation-asserted change)
                     (response No)
                     (valid-answers No Yes))))
                    
   (defrule determine-french ""
   
   (logical (summer No))

   =>

   (assert (UI-state (display FrenchQuestion)
                     (relation-asserted french)
                     (response No)
                     (valid-answers No Yes))))
                     
    (defrule determine-dinner ""
   
   (logical (french No))

   =>

   (assert (UI-state (display DinnerQuestion)
                     (relation-asserted dinner)
                     (response No)
                     (valid-answers No Yes))))
                     
                     
   (defrule determine-graduate ""
   
   (logical (dinner No))

   =>

   (assert (UI-state (display GraduateQuestion)
                     (relation-asserted graduate)
                     (response No)
                     (valid-answers No Yes))))
                     
    (defrule determine-pattorhead ""
   
   (logical (graduate No))

   =>

   (assert (UI-state (display PattorheadQuestion)
                     (relation-asserted pattorhead)
                     (response No)
                     (valid-answers No Yes))))

 (defrule determine-move-back ""
   
   (logical (graduate Yes))

   =>

   (assert (UI-state (display MoveBackQuestion)
                     (relation-asserted move-back)
                     (response No)
                     (valid-answers No Yes))))
                     
                     
   (defrule determine-worldly ""
   
   (logical (pattorhead No))

   =>

   (assert (UI-state (display WorldlyQuestion)
                     (relation-asserted worldly)
                     (response No)
                     (valid-answers No Yes))))      
                     
                     
   (defrule determine-bag ""
   
   (logical (worldly No))

   =>

   (assert (UI-state (display BagQuestion)
                     (relation-asserted bag)
                     (response No)
                     (valid-answers No Yes))))  
                     
    (defrule determine-drunk ""
   
   (logical (bag No))

   =>

   (assert (UI-state (display DrunkQuestion)
                     (relation-asserted drunk)
                     (response No)
                     (valid-answers No Yes))))
                     
    (defrule determine-love ""
   
   (logical (drunk No))

   =>

   (assert (UI-state (display LoveQuestion)
                     (relation-asserted love)
                     (response No)
                     (valid-answers No Yes))))   
                     
   (defrule determine-500 ""
   
   (logical (love Yes))

   =>

   (assert (UI-state (display ExpensiveQuestion)
                     (relation-asserted expensive)
                     (response No)
                     (valid-answers No Yes))))
                     
                    
;;;****************
;;;* RESULT BEER RULES *
;;;****************

(defrule result-in-scotland ""

   (logical (in-scotland Yes))
   
   =>

   (assert (UI-state (display ScotlandBeer)
                     (state final))))

(defrule result-double-wide ""

   (logical (in-scotland No)

            (double-wide Yes))

   =>

   (assert (UI-state (display DoubleWideBeer)
                     (state final))))

(defrule result-mckenzie ""

   (logical (in-scotland No)

            (double-wide No)
            
            (mckenzie    Yes))

   =>

   (assert (UI-state (display MckenzieBeer)
                     (state final))))

(defrule result-projects ""

   (logical (in-scotland No)

            (double-wide No)
            
            (mckenzie    No)
            
            (projects    Yes))

   =>

   (assert (UI-state (display ProjectsBeer)
                     (state final))))
                     
(defrule result-hockey ""

   (logical (in-scotland No)

            (double-wide No)
            
            (mckenzie    No)
            
            (projects    No)
            
            (hockey      Yes))

   =>

   (assert (UI-state (display HockeyBeer)
                     (state final))))
                     
 (defrule result-stargate ""

   (logical (in-scotland No)

            (double-wide No)
            
            (mckenzie    No)
            
            (projects    No)
            
            (hockey      No)
            
            (stargate    Yes))

   =>

   (assert (UI-state (display StargateBeer)
                     (state final))))

(defrule result-hipster ""

	(logical (in-scotland No)

            (double-wide No)
            
            (mckenzie    No)
            
            (projects    No)
            
            (hockey      No)
            
            (stargate    No)
            
            (hipster     Yes))

   =>

   (assert (UI-state (display HipsterBeer)
                     (state final))))
                     
 (defrule result-driver ""

	(logical  (driver     Yes))

   =>

   (assert (UI-state (display DriverBeer)
                     (state final))))
                     
  (defrule result-beer-gut-yes ""

	(logical  (beer-gut     Yes))

   =>

   (assert (UI-state (display LightBeer)
                     (state final))))
    
   (defrule result-beer-gut-no ""

	(logical  (beer-gut     No))

   =>

   (assert (UI-state (display BeerGutBeer)
                     (state final)))) 
                     
  (defrule result-guiness ""

	(logical  (guiness     Yes))

   =>

   (assert (UI-state (display GuinnessBeer)
                     (state final))))
                     
 	(defrule result-change-yes ""

	(logical  (change     Yes))

   =>

   (assert (UI-state (display ChangeBeer)
                     (state final))))
                     
   (defrule result-change-no ""

	(logical  (change     No))

   =>

   (assert (UI-state (display NoChangeBeer)
                     (state final))))                             
  
(defrule result-french ""

	(logical  (french     Yes))

   =>

   (assert (UI-state (display FrenchBeer)
                     (state final))))  
                     
(defrule result-dinner ""

	(logical  (dinner     Yes))

   =>

   (assert (UI-state (display DinnerBeer)
                     (state final))))                       
 
 (defrule result-pattorhead ""

	(logical  (pattorhead     Yes))

   =>

   (assert (UI-state (display PattorheadBeer)
                     (state final))))                               
  
  (defrule result-move-back-yes ""

	(logical  (move-back     Yes))

   =>

   (assert (UI-state (display MoveBackBeer)
                     (state final))))           
  
  (defrule result-move-back-no ""

	(logical  (move-back     No))

   =>

   (assert (UI-state (display NoMoveBackBeer)
                     (state final))))   
                     
 (defrule result-worldly ""

	(logical  (worldly    Yes))

   =>

   (assert (UI-state (display WorldlyBeer)
                     (state final))))
                    
  (defrule result-bag ""

	(logical  (bag    Yes))

   =>

   (assert (UI-state (display BagBeer)
                     (state final)))) 
                     
   (defrule result-drunk ""

	(logical  (drunk    Yes))

   =>

   (assert (UI-state (display DrunkBeer)
                     (state final))))                     
     
     (defrule result-love ""

	(logical  (love    No))

   =>

   (assert (UI-state (display NoLoveBeer)
                     (state final)))) 
                     
     (defrule result-expensive-yes ""

	(logical  (expensive     Yes))

   =>

   (assert (UI-state (display ExpensiveBeer)
                     (state final))))
                     
       (defrule result-expensive-no ""

	(logical  (expensive     No))

   =>

   (assert (UI-state (display NoExpensiveBeer)
                     (state final))))                                              
                                          
(defrule no-result ""

   (declare (salience -10))
  
   (logical (UI-state (id ?id)))
   
   (state-list (current ?id))
     
   =>
  
   (assert (UI-state (display Anything)
                     (state final))))
                     
;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))
   

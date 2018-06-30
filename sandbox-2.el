(request
 "https://en.wikipedia.org/w/api.php"
 :params '(("action" . "query")
           ("meta" . "tokens")
           ("type" . "login")
           ("format" . "json"))
 :parser 'json-read
 :success (function*
           (lambda (&key data &allow-other-keys)
             (message "I sent: %S" (assoc-default 'args data)))))






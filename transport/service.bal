import ballerina/http;
import ballerina/log;

configurable int dbPort = 9090;
configurable string message = "name should not be empty!";
configurable string input = ?;
configurable PushNotification[] pushNotifications = ?;

type PushNotification record {|
    string appName;
    int[] runDays;
    boolean isEnabled;
|}; 

configurable int[] myNumbers = ?;



# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(dbPort) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error(message);
        }
        log:printInfo("Push Notification App: " + pushNotifications[0].appName);
        log:printInfo("Runs on days: " + pushNotifications[0].runDays.toJsonString());
        log:printInfo("Int array " + myNumbers[0]);
        return "Hello, " + name + "!" + input;
    }
}

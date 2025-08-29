package org.example;
public class AssociationTest{

    static void main(){

        CPU cpu = new CPU();
        int locA=2;
        int locB=3;
        int result_loc=4;
        int result;
        char operation='+';
        result=CPU.cpu_operation(locA, locB, result_loc, operation);
    }
}
class processors{
}
class CPU extends processors{ //is A
    static DataBus dbus = new DataBus(); //has A

    static int cpu_operation(int locA, int locB, int result_loc, char operation)
    {
        System.out.println("Computer starting...");
        int op1 = dbus.memory_fetch(locA);
        int op2 = dbus.memory_fetch(locB);
        System.out.println(STR."Memory location \{locA} and\{locB} are fetched.");
        ALU alu = new ALU(op1, op2); //has A
        if(operation=='+' || operation=='-' || operation=='*' || operation=='/') {
            int result = alu.computation(operation);
            System.out.println(STR."The result of the \{operation} arithmetic operation is: \{result}");
            dbus.memory_save(result, result_loc);
            return result;
        }
        else {
            System.out.println(STR."\{+operation} is not a valid operation");
            return -1;
        }
    }
}
class DataBus{

    int memory_fetch(int locA){
        return Memory.ssd[locA].getValue();
    }
    void memory_save(int r, int locA){
        Memory.ssd[locA].setValue(r);
    }
}
class Memory{
    static Memory[] ssd = {
            new Memory(10),
            new Memory(20),
            new Memory(30),
            new Memory(40),
            new Memory(50)
    };
    int value;
    Memory(int value){
        this.value = value;
    }
    int getValue() {
        return value;
    }
    void setValue(int v) {
        this.value = v;
    }
}
class ALU{
    int operandA;
    int operandB;

    public ALU( int a, int b) {
        operandA = a;
        operandB = b;
    }
     int computation(char operation){
        if(operation=='+'){
            return operandA+operandB;
        }
        else if(operation=='-'){
            return operandA-operandB;
        }
        else if(operation=='*'){
            return operandA*operandB;
        }
        else if(operation=='/'){
            return operandA/operandB;
        }
        else{
            return -1;
        }
    }

}




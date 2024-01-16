

## Example of letting objects see attributes before full intitilzation of that object.
```
public class ImproperPublicationExample {
    private int value;

    public ImproperPublicationExample() {
        // Simulate some initialization process that takes time
        try {
            Thread.sleep(100);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        this.value = 42; // Set the value after the initialization
    }

    public int getValue() {
        return this.value;
    }

    public static void main(String[] args) {
        ImproperPublicationExample example = new ImproperPublicationExample();

        // In a multi-threaded environment, another thread might access the object
        // before its constructor completes.
        int v = example.getValue();
        System.out.println("Value: " + v);
    }
}
```
### Solution to this issue
- Make value a volatile
- Use locks, or synchornization. Some sort of hb atleast
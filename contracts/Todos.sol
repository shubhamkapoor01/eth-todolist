pragma solidity >=0.7.0 <0.9.0;

contract Todo {
    struct Task {
        string name;
        string description;
        uint importance;
        uint deadline;
        uint index;
        bool done;
    }

    mapping(address => Task[]) public Tasks;

    constructor() {
    }

    // adds a task to the list of todos of a address.
    function addTask(string memory name, string memory description, uint importance, uint deadline) public {
        Task memory task;
        task.name = name;
        task.description = description;
        task.importance = importance;
        task.deadline = deadline;
        task.index = Tasks[msg.sender].length;
        task.done = false;
        Tasks[msg.sender].push(task);
    }

    function updateName(uint idx, string memory name) public {
        Tasks[msg.sender][idx].name = name;
    }

    function updateDescription(uint idx, string memory description) public {
        Tasks[msg.sender][idx].description = description;
    }

    function updateImportance(uint idx, uint importance) public {
        Tasks[msg.sender][idx].importance = importance;
    }

    function updateDeadline(uint idx, uint deadline) public {
        Tasks[msg.sender][idx].deadline = deadline;
    }

    function updateDone(uint idx, bool done) public {
        Tasks[msg.sender][idx].done = done;
    }

    // returns array of todos active of an address.
    function getTodos() public view returns(Task[] memory) {
        Task[] memory tasksOfUser = Tasks[msg.sender];
        return tasksOfUser;
    }
}

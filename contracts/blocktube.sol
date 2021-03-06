/// @title Blocktu.be contract.
pragma solidity ^0.4.11;

import "./blocktubeClip.sol";

contract blocktube {

	address owner;
	string public name;
    string public symbol;
    uint8 public decimals;
    uint public numClips;
    uint256 public totalSupply;
	mapping(address => uint256) public balanceOf;
    mapping(address => blocktubeClip) public Clips;

//    Clip[] public clips;

    // struct Clip {
    //     address clip;
    //     string title;
    //     string description;
    //     string tags;
    // }

	/* This generates a public event on the blockchain that will notify clients */
    event Transfer(address indexed from, address indexed to, uint256 value);

    event ClipAdded(address clipaddress);

    function blocktube(uint256 _initialSupply, string _tokenName, uint8 _decimalUnits, string _tokenSymbol){
    	balanceOf[msg.sender] = _initialSupply;              // Give the creator all initial tokens
        totalSupply = _initialSupply;                        // Update total supply
        name = _tokenName;                                   // Set the name for display purposes
        symbol = _tokenSymbol;                               // Set the symbol for display purposes
        decimals = _decimalUnits;                            // Amount of decimals for display purposes
        numClips = 0;
    }

    /* Receive a like and do something with it */
    function like(address _clipaddr, uint256 _value){
    	var clipcontract = blocktubeClip(_clipaddr);
    	clipcontract.blocktubeTransfer(msg.sender, _value);
    }

	/* Send coins */
    function transfer(address _to, uint256 _value) {
        if (balanceOf[msg.sender] < _value) throw;           // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) throw; // Check for overflows
        balanceOf[msg.sender] -= _value;                     // Subtract from the sender
        balanceOf[_to] += _value;                            // Add the same to the recipient
        Transfer(msg.sender, _to, _value);                   // Notify anyone listening that this transfer took place
    }

    function addclip(address _clipaddr){ //, string _title, string _description, string _tags) {
        //address _clipaddr = blocktubeClip(_clipaddr);
        ClipAdded(_clipaddr);

//Clips[address] = 

//        clips.push(Clip({clip: _clip, title: _title, description: _description, tags: _tags}));

//        numClips = clips.length;
    }
}



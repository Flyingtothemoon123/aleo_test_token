// The 'token_17593' program.
program token_17593.aleo {
    record Token {
        owner: address,
        balance: u32
    }
    
     transition mint(balance: u32) -> Token {
        return Token {
            owner: self.caller,
            balance: balance
        };
     

    }

transition mint(receiver: address, balance: u32) -> Token {
assert_eq(self.caller, aleo127t2ea84l4068zw2ra549rdrjfx54d3pye3wc9mzvhy4jt88zu9qd48g46)
return Token {
owner: receiver,
balance: balance
};
}

    transition transfer (receiver: address, amount: u32, input: Token) -> (Token, Token) {
      let balance: u32 = input.balance - amount;
          let recipient: Token = Token {
owner: receiver,
balance: amount
          };
       let sender: Token = Token {
        owner: self.caller,
        balance: balance
       };
         return (recipient, sender); 
   
}
}

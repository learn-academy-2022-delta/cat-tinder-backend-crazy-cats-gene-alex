require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate name" do
    cat = Cat.create(age: 5, enjoys: 'walks in the museum',image:'https://images.unsplash.com/photo-1618661057302-8b01d93bd898?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1162&q=80')
    expect(cat.errors[:name]).to_not be_empty
  end

  it "should validate age" do
    cat = Cat.create(name:'Spidey', enjoys: 'walks in the museum',image:'https://images.unsplash.com/photo-1618661057302-8b01d93bd898?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1162&q=80')
    expect(cat.errors[:age]).to_not be_empty
    end
    
  it "should validate enjoys" do
    cat = Cat.create(name:'Spidey',age: 5,image:'https://images.unsplash.com/photo-1618661057302-8b01d93bd898?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1162&q=80')
    expect(cat.errors[:enjoys]).to_not be_empty
    end

  it "should validate image" do
    cat = Cat.create(name:'Spidey',age: 5, enjoys: 'walks in the museum')
    expect(cat.errors[:image]).to_not be_empty
    end

  it "should have enjoys with more than 10 characters" do
    cat = Cat.create(name:'Spidey',age: 5, enjoys: 'short',image:'https://images.unsplash.com/photo-1618661057302-8b01d93bd898?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1162&q=80')
    expect(cat.errors[:enjoys]).to_not be_empty
  end
end

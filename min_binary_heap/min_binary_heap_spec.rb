include RSpec

require 'pry'
require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:tree) { MinBinaryHeap.new }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node " do
      tree.insert(pacific_rim)
      expect(tree.items[0].title).to eq "Pacific Rim"
      tree.insert(braveheart)
      expect(tree.items[1].title).to eq "Braveheart"
    end
     it "properly inserts a new node " do
      tree.insert(braveheart)
      expect(tree.items[0].title).to eq "Braveheart"
    end
     it "inserts items in correct order" do
      tree.insert(pacific_rim)
      tree.insert(braveheart)
      tree.insert(jedi)
      tree.insert(donnie)
      tree.insert(inception)
      tree.insert(district)
      tree.insert(shawshank)
      tree.insert(root)
      tree.insert(hope)
    
      expect(tree.items.size).to eq 9
      expect(tree.items[0].title).to eq "Pacific Rim"
      expect(tree.items[1].title).to eq "Braveheart"
      expect(tree.items[2].title).to eq "Star Wars: Return of the Jedi"
      expect(tree.items[3].title).to eq "Donnie Darko"
      expect(tree.items[4].title).to eq "Inception"
      expect(tree.items[5].title).to eq "District 9" 
      expect(tree.items[6].title).to eq "The Shawshank Redemption" 
      expect(tree.items[7].title).to eq "The Matrix"
      expect(tree.items[8].title).to eq "Star Wars: A New Hope"
    end
  end
  describe "delete(node)" do 
      it "deletes the node " do
        tree.insert(pacific_rim)
        tree.insert(braveheart)
        tree.delete(pacific_rim)
        expect(tree.items[0].title).to eq braveheart.title
        
      end
      
      it "sorts correctly after deleteion " do 
        tree.insert(pacific_rim)
        tree.insert(braveheart)
        tree.insert(jedi)
        tree.insert(donnie)
        tree.insert(inception)
        
        tree.delete(jedi)
        expect(tree.items.size).to eq 4
        expect(tree.items[3].title).to eq "Donnie Darko"
      end
  end
  
  
  
end
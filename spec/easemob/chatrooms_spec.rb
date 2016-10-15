require 'spec_helper'

RSpec.describe Easemob::Chatrooms do
  describe '#create_chatroom' do
    it 'can create chat room without any member' do
      res = Easemob.create_chatroom('c1', 'chat room 1', 'u1')
      expect(res.code).to eq 200
      h1 = JSON.parse res.to_s
      expect(h1['data']['id']).not_to be nil
    end

    it 'can create chat room with members' do
      res = Easemob.create_chatroom 'c2', 'chat room 2', 'u1', members: %w(u2 u3)
      expect(res.code).to eq 200
      h1 = JSON.parse res.to_s
      expect(h1['data']['id']).not_to be nil
    end
  end

  describe '#modify_chatroom' do
    it 'can modify chat room with new name and description' do
      res = Easemob.modify_chatroom($easemob_rspec_chatroom_c_id, chatroom_name: 'g', description: 'chat room after modified')
      expect(res.code).to eq 200
      h1 = JSON.parse res.to_s
      expect(h1['data']['name']).to be true
      expect(h1['data']['description']).to be true
      expect(h1['data']['maxusers']).to be nil
    end

    it 'can set maxusers to 500' do
      res = Easemob.modify_chatroom($easemob_rspec_chatroom_c_id, maxusers: 500)
      expect(res.code).to eq 200
      h1 = JSON.parse res.to_s
      expect(h1['data']['name']).to be nil
      expect(h1['data']['description']).to be nil
      expect(h1['data']['maxusers']).to be true
    end
  end
end

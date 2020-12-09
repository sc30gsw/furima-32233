require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが英数6文字以上であれば登録できる' do
        @user.password = "aaa111"
        @user.password_confirmation = "aaa111"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = "000aa"
        @user.password_confirmation = "000aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password_confirmation = "111aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが英語のみだと登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters")
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = 111111
        @user.password_confirmation = 111111
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters")
      end
      it 'family_nameが空だと登録できない' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'family_name_readingが空だと登録できない' do
        @user.family_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading can't be blank")
      end
      it 'first_name_readingが空だと登録できない' do
        @user.first_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it 'family_name_readingがカタカナでないと登録できない' do
        @user.family_name_reading = "てすと"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading is invalid. Input full-width katakana characters")
      end
      it 'first_name_readingがカタカナでないと登録できない' do
        @user.first_name_reading = "てすと"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid. Input full-width katakana characters")
      end
      it 'birthが空だと登録できない' do
        @user.birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end

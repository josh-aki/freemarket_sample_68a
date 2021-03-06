require 'rails_helper'
describe Profile do
  describe '#create' do
    # 1. lastname, firstname, lastname_kana, firstname_kane, birthdayが存在すれば登録できること
    it "is valid with a lastname, firstname, lastname_kana, firstname_kane, birthday" do
      profile = build(:profile)
      expect(profile).to be_valid
    end

    # 2. lastnameが空だと登録できないこと
    it "は不正な値です without a lastname" do
      profile = build(:profile, lastname: "")
      profile.valid?
      expect(profile.errors[:lastname]).to include("を入力してください")
    end

    # 3. firstnameが空だと登録できないこと
    it "は不正な値です without a firstname" do
      profile = build(:profile, firstname: "")
      profile.valid?
      expect(profile.errors[:firstname]).to include("を入力してください")
    end

    # 4. lastname_kanaが空だと登録できないこと
    it "は不正な値です without a lastname_kana" do
      profile = build(:profile, lastname_kana: "")
      profile.valid?
      expect(profile.errors[:lastname_kana]).to include("を入力してください")
    end

    # 5. firstname_kanaが空だと登録できないこと
    it "は不正な値です without a firstname_kana" do
      profile = build(:profile, firstname_kana: "")
      profile.valid?
      expect(profile.errors[:firstname_kana]).to include("を入力してください")
    end

    # 6. lastnameが半角だと登録できないこと
    it "は不正な値です a lastname with Half-width alphanumeric" do
      profile = build(:profile, lastname: "mamada")
      profile.valid?
      expect(profile.errors[:lastname]).to include("は不正な値です")
    end

    # 7. firstnameが半角だと登録できないこと
    it "は不正な値です a firstname with Half-width alphanumeric" do
      profile = build(:profile, firstname: "eiichi")
      profile.valid?
      expect(profile.errors[:firstname]).to include("は不正な値です")
    end

    # 8. lastname_kanaが全角だと登録できないこと
    it "は不正な値です a withlastname_kana with Full-width" do
      profile = build(:profile, lastname_kana: "間々田")
      profile.valid?
      expect(profile.errors[:lastname_kana]).to include("は不正な値です")
    end

    # 9. firstname_kanaが全角だと登録できないこと
    it "は不正な値です a firstname_kana with Full-width" do
      profile = build(:profile, firstname_kana: "英一")
      profile.valid?
      expect(profile.errors[:firstname_kana]).to include("は不正な値です")
    end

    # 10. birthdayが空だと登録できないこと
      it "は不正な値です without a birthday" do
      profile = build(:profile, birthday: "")
      profile.valid?
      expect(profile.errors[:birthday]).to include("を入力してください")
    end

    # 11. birthdayのmounthが[0]だと登録できないこと
    it "は不正な値です a birthday with a mounth that has value of [0]" do
      profile = build(:profile, birthday: "2020-0-01")
      profile.valid?
      expect(profile.errors[:birthday]).to include("を入力してください")
    end

    # 12. birthdayのmounthが[13]だと登録できないこと
    it "は不正な値です a birthday with a mounth that has value of [13]" do
      profile = build(:profile, birthday: "2020-13-01")
      profile.valid?
      expect(profile.errors[:birthday]).to include("を入力してください")
    end

    # 13. birthdayのdayが[0]だと登録できないこと
    it "は不正な値です a birthday with a day that has value of [0]" do
      profile = build(:profile, birthday: "2020-02-0")
      profile.valid?
      expect(profile.errors[:birthday]).to include("を入力してください")
    end

    # 14. birthdayのmounthが[1],dayが[32]だと登録できないこと
    it "は不正な値です a birthday with a day that has value of [32]" do
      profile = build(:profile, birthday: "2020-01-32")
      profile.valid?
      expect(profile.errors[:birthday]).to include("を入力してください")
    end

    # 15. birthdayのmounthが[1],dayが[31]だと登録できること
    it "is valid a birthday with a day that has value of [31]" do
      profile = build(:profile, birthday: "2020-01-31")
      profile.valid?
      expect(profile).to be_valid
    end
  end
end
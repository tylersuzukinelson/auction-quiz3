class Auction < ApplicationRecord
  belongs_to :user

  include AASM

  aasm whiny_transitions: false do
    state :draft, initial: true
    state :published, :reserve_not_met, :reserve_met, :won, :canceled

    event :publish do
      transitions from: :draft, to: :published
    end

    event :not_met do
      transitions from: [:published], to: :reserve_not_met
    end

    event :meet do
      transitions from: [:published, :reserve_not_met], to: :reserve_met
    end

  end

end

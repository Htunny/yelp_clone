def sign_up
  visit '/restaurants'
  click_link 'Sign up'
  fill_in 'Email', with: 'steve@email.com'
  fill_in 'Password', with: '12345678'
  fill_in 'Password confirmation', with: '12345678'
  click_button 'Sign up'
end

def leave_review(thoughts, rating)
  visit '/restaurants'
  click_link 'Review Hawksmoor'
  fill_in "Thoughts", with: thoughts
  select rating, from: "Rating"
  click_button 'Leave Review'
end

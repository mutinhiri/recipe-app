<%= form_with(model: recipe) do |form| %>
  <% if recipe.errors.any? %>
    <div style="color: red">
      <h2><%= pluralize(recipe.errors.count, "error") %> prohibited this recipe from being saved:</h2>

      <ul>
        <% recipe.errors.each do |error| %>
          <li><%= error.full_message %></li>
        <% end %>
      </ul>
    </div>
    <div>
      <%= form.label :name, style: "display: block "%>
      <%= form.text_field :name %>
    </div>
  <% end %>

  <div>
    <%= form.label :name, style: "display: block" %>
    <%= form.text_field :name %>
  </div>

  <div>
    <%= form.label :preparation_time, style: "display: block" %>
    <%= form.text_field :preparation_time %>
  </div>

  <div>
    <%= form.label :cooking_time, style: "display: block" %>
    <%= form.text_field :cooking_time %>
  </div>

  <div>
    <%= form.label :description, "Recipe", style: "display: block" %>
    <%= form.text_area :description, required: true %>
  </div>

  <div>
    <%= form.label :public, style: "display: block" %>
    <%= form.check_box :public %>
  </div>

  <div>
    <%= form.submit %>
  </div>
<% end %>

require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { address: @customer.address, cell_phone: @customer.cell_phone, city: @customer.city, cnpj_cpf: @customer.cnpj_cpf, company_name: @customer.company_name, costumer_type: @customer.costumer_type, email: @customer.email, ie_rg: @customer.ie_rg, name: @customer.name, neighborhood: @customer.neighborhood, number: @customer.number, phone: @customer.phone, postal_code: @customer.postal_code, state: @customer.state }
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    patch :update, id: @customer, customer: { address: @customer.address, cell_phone: @customer.cell_phone, city: @customer.city, cnpj_cpf: @customer.cnpj_cpf, company_name: @customer.company_name, costumer_type: @customer.costumer_type, email: @customer.email, ie_rg: @customer.ie_rg, name: @customer.name, neighborhood: @customer.neighborhood, number: @customer.number, phone: @customer.phone, postal_code: @customer.postal_code, state: @customer.state }
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
end

using Plots, CSV, DataFrames

# INPUT STRINGS
str_regression = "linear_regression/"
str_folder = "scripts/"*str_regression*"scaling/posterior_samples/"
str_h = "h_"
str_iter = "_iter_"
str_csv = ".csv"
str_data = "test_data"
str_param = "true_params"
str_d = "d_"
h = 1e-06
# pp = [10, 50, 100, 200, 300, 400, 500, 600, 700,  800,  900, 1000]
# pp = [10, 50, 100,  500]
# xtrue = Matrix(CSV.read(str_folder*str_param*str_csv, DataFrame, header=false))[:]
# j = 7

d = 30

str_sampler = "zz_" # "sgld2_" "zz_" "bps_" "szz_"
DIRIN = str_folder*str_sampler*str_h*string(h)*str_d*string(d)*str_csv 
trace = Matrix(CSV.read(DIRIN, DataFrame, header=false))
f1 = plot(trace[1,:],  label = "sgld1", color = :black)

hline!(f1, [xtrue[j]])



str_sampler = "sgld2_" # "sgld2_" "zz_" "bps_" "szz_"
DIRIN = str_folder*str_sampler*str_h*string(h)*str_iter*string(iter)*str_csv 
trace = Matrix(CSV.read(DIRIN, DataFrame, header=false))
f2 = plot( trace[2,:],  label = "sgld10",  color = :black)

str_sampler = "sgld3_" # "sgld2_" "zz_" "bps_" "szz_"
DIRIN = str_folder*str_sampler*str_h*string(h)*str_iter*string(iter)*str_csv 
trace = Matrix(CSV.read(DIRIN, DataFrame, header=false))
f3 = plot(trace[j,:],  label = "sgld100",  color = :black)

str_sampler = "zz_" # "sgld2_" "zz_" "bps_" "szz_"
DIRIN = str_folder*str_sampler*str_h*string(h)*str_iter*string(iter)*str_csv 
trace = Matrix(CSV.read(DIRIN, DataFrame, header=false))
f4 = plot(trace[j,:],  label = "zz",  color = :black)

str_sampler = "bps_" # "sgld2_" "zz_" "bps_" "szz_"
DIRIN = str_folder*str_sampler*str_h*string(h)*str_iter*string(iter)*str_csv 
trace = Matrix(CSV.read(DIRIN, DataFrame, header=false))
f5 = plot(trace[j,:], label = "bps",  color = :black)


str_sampler = "szz_" # "sgld2_" "zz_" "bps_" "szz_"
DIRIN = str_folder*str_sampler*str_h*string(h)*str_iter*string(iter)*str_csv 
trace = Matrix(CSV.read(DIRIN, DataFrame, header=false))
f6 = plot(trace[2,:], label = "szz",  color = :black)
l = @layout [a b c; d e f]
f = plot(f1,f2,f3,f4,f5,f6, layout = l, plot_title = "traces h = $h")
savefig(f, "./scripts/logistic_regression/prediction/output_traces_h00001.png")


trace = Matrix(CSV.read("./scripts/toy/posterior_samples/zz_h_0.0008.csv", DataFrame, header=false))
var(trace, dims = 2)
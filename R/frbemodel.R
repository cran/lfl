.frbemodel <- structure(list(model = structure(list(arima = structure(list(
    rules = list(c("Bi.weight", "RoBi.seasonStrength", "RoMe.frequency"
    ), c("Bi.weight", "RoBi.trendStrength", "Lm.varcoef", "RoSm.frequency"
    ), c("RoBi.weight", "RoBi.trendStrength", "Lm.varcoef"), 
        c("RoBi.weight", "RoBi.trendStrength", "RoSm.skewness"
        ), c("MlBi.weight", "RoBi.trendStrength", "RoSm.skewness", 
        "RoMe.varcoef"), c("VeBi.weight", "Bi.seasonStrength", 
        "Me.frequency"), c("RoBi.weight", "Me.trendStrength", 
        "VeBi.seasonStrength", "Me.kurtosis"), c("RoBi.weight", 
        "MlMe.trendStrength", "Me.frequency"), c("MlBi.weight", 
        "RoBi.trendStrength", "Lm.varcoef"), c("MlBi.weight", 
        "MlMe.trendStrength", "RoMe.kurtosis", "Me.frequency"
        ), c("RoSm.weight", "MlSm.seasonStrength", "RoMe.skewness", 
        "Me.kurtosis", "RoMe.varcoef"), c("RoSm.weight", "RoMe.length", 
        "RoSm.seasonStrength", "MlMe.kurtosis"), c("MlBi.weight", 
        "MlMe.trendStrength", "VeBi.seasonStrength", "VeBi.stationarity"
        ), c("RoBi.weight", "VeBi.trendStrength", "ExBi.seasonStrength"
        ), c("MlBi.weight", "MlSm.length", "RoMe.stationarity"
        ), c("Bi.weight", "RoBi.trendStrength", "MlSm.skewness", 
        "RoMe.varcoef"), c("RoBi.weight", "ExBi.seasonStrength", 
        "ExBi.stationarity"), c("RoBi.weight", "MlMe.stationarity", 
        "VeBi.frequency"), c("MlBi.weight", "ExBi.seasonStrength", 
        "Me.varcoef"), c("Bi.weight", "RoBi.length", "MlBi.seasonStrength", 
        "RoMe.kurtosis", "MlMe.varcoef", "RoBi.stationarity"), 
        c("RoBi.weight", "RoBi.trendStrength", "RoMe.seasonStrength", 
        "MlMe.kurtosis"), c("RoBi.weight", "RoBi.trendStrength", 
        "Lm.kurtosis", "RoMe.stationarity"), c("Bi.weight", "MlBi.seasonStrength", 
        "RoSm.skewness"), c("Bi.weight", "MlMe.trendStrength", 
        "ExBi.seasonStrength", "Bi.stationarity"), c("MlBi.weight", 
        "RoBi.length", "RoMe.kurtosis", "MlMe.varcoef", "MlBi.stationarity"
        )), statistics = structure(c(0.0521010793745518, 0.0415378697216511, 
    0.0606136918067932, 0.0738747045397758, 0.0572777949273586, 
    0.0467931032180786, 0.0549793466925621, 0.0500883981585503, 
    0.0588301680982113, 0.0440112166106701, 0.0410577803850174, 
    0.0419421568512917, 0.0476003736257553, 0.0645038709044456, 
    0.042144138365984, 0.0476334095001221, 0.0793948173522949, 
    0.0427263006567955, 0.0676820799708366, 0.0490907058119774, 
    0.0415423475205898, 0.0417911596596241, 0.0517325587570667, 
    0.0448877066373825, 0.0524002015590668, 0.098347045481205, 
    0.0794578567147255, 0.116963088512421, 0.143048137426376, 
    0.11161595582962, 0.0926523059606552, 0.109095767140388, 
    0.0994328707456589, 0.116963088512421, 0.0875083059072495, 
    0.0817394480109215, 0.0835503414273262, 0.0948260799050331, 
    0.12855638563633, 0.0840308740735054, 0.095007948577404, 
    0.158527165651321, 0.0853179320693016, 0.135151937603951, 
    0.0980432406067848, 0.082973025739193, 0.0834815874695778, 
    0.103371612727642, 0.0897175744175911, 0.104799337685108, 
    0.407637059688568, 0.407637059688568, 0.432578235864639, 
    0.432578235864639, 0.419992297887802, 0.385321617126465, 
    0.432578235864639, 0.432578235864639, 0.419992297887802, 
    0.419992297887802, 0.350930005311966, 0.350930005311966, 
    0.419992297887802, 0.432578235864639, 0.419992297887802, 
    0.407637059688568, 0.432578235864639, 0.432578235864639, 
    0.419992297887802, 0.407637059688568, 0.432578235864639, 
    0.432578235864639, 0.407637059688568, 0.407637059688568, 
    0.419992297887802, 0.529767611417557, 0.522766047802962, 
    0.518229234348206, 0.516432481183458, 0.513168520590301, 
    0.505039812370663, 0.503954902501512, 0.503740843273773, 
    0.502980631295179, 0.502937591516374, 0.502300680811198, 
    0.501998629027433, 0.50197555011687, 0.50175547939656, 0.501531595745615, 
    0.501362361921904, 0.500827836201417, 0.500789220044504, 
    0.500785125028487, 0.500704643259009, 0.500672925333214, 
    0.500603317765771, 0.500452274971939, 0.500322338502514, 
    0.500005083204956, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
    1, 1, 1, 1, 1), .Dim = c(25L, 7L), .Dimnames = list(NULL, 
        c("support", "lhsSupport", "rhsSupport", "confidence", 
        "lift", "loLift", "hiLift")))), .Names = c("rules", "statistics"
), class = c("farules", "list")), expSmooth = structure(list(
    rules = list(c("Bi.weight", "RoSm.skewness", "RoBi.stationarity"
    ), c("RoSm.weight", "RoMe.length", "RoSm.seasonStrength"), 
        c("MlBi.weight", "RoSm.skewness", "Lm.kurtosis", "RoMe.varcoef"
        ), c("MlSm.weight", "RoMe.length", "RoSm.seasonStrength"
        ), c("Sm.weight", "RoMe.length", "RoBi.trendStrength", 
        "RoSm.seasonStrength"), c("Sm.weight", "RoMe.length", 
        "RoSm.seasonStrength", "RoMe.varcoef"), c("RoBi.weight", 
        "RoSm.skewness", "Lm.kurtosis"), c("MlBi.weight", "ExBi.stationarity"
        ), c("VeBi.weight", "ExBi.seasonStrength", "TyMe.kurtosis"
        ), c("Bi.weight", "RoBi.seasonStrength", "ExBi.stationarity"
        ), c("VeBi.weight", "RoSm.skewness", "MlBi.stationarity"
        ), c("MlBi.weight", "VeBi.seasonStrength", "RoMe.kurtosis"
        ), c("RoBi.weight", "RoMe.kurtosis", "VeBi.stationarity"
        ), c("Bi.weight", "MlBi.seasonStrength", "Me.frequency"
        ), c("Bi.weight", "ExBi.seasonStrength", "Me.kurtosis"
        ), c("RoBi.weight", "MlSm.length", "RoMe.stationarity"
        ), c("ExBi.weight", "RoBi.length", "ExBi.seasonStrength", 
        "RoMe.kurtosis", "ExBi.stationarity"), c("RoBi.weight", 
        "RoBi.seasonStrength"), c("VeBi.weight", "RoBi.length", 
        "RoBi.seasonStrength", "ExBi.stationarity"), c("VeBi.weight", 
        "RoBi.trendStrength", "VeBi.seasonStrength", "Me.kurtosis"
        )), statistics = structure(c(0.0506450869143009, 0.0656070560216904, 
    0.0402356497943401, 0.0633988752961159, 0.0431304648518562, 
    0.0454663634300232, 0.0514258034527302, 0.11613143235445, 
    0.0401789546012878, 0.0970917418599129, 0.0441575720906258, 
    0.162366315722466, 0.125852197408676, 0.0480449795722961, 
    0.101617366075516, 0.042124081403017, 0.0512996278703213, 
    0.208628430962563, 0.0637500956654549, 0.0444145984947681, 
    0.0934314802289009, 0.122783921658993, 0.0778173357248306, 
    0.122783921658993, 0.0838589370250702, 0.0886050388216972, 
    0.100645042955875, 0.228992059826851, 0.0794920325279236, 
    0.192233994603157, 0.0876394733786583, 0.322822600603104, 
    0.250311017036438, 0.0957202091813087, 0.20253498852253, 
    0.0840308740735054, 0.102384231984615, 0.416412055492401, 
    0.127344310283661, 0.088815338909626, 0.394650638103485, 
    0.340373128652573, 0.409539997577667, 0.32291853427887, 0.304438710212708, 
    0.304438710212708, 0.422608882188797, 0.409539997577667, 
    0.366965293884277, 0.394650638103485, 0.366965293884277, 
    0.409539997577667, 0.422608882188797, 0.394650638103485, 
    0.394650638103485, 0.422608882188797, 0.341005742549896, 
    0.422608882188797, 0.366965293884277, 0.366965293884277, 
    0.54205591937775, 0.534329374198525, 0.517052523317133, 0.51634509176367, 
    0.514321626077398, 0.513135189992034, 0.510962109433211, 
    0.50714174300306, 0.505446311077453, 0.50507061490527, 0.50385483148486, 
    0.502958328875145, 0.502783292955722, 0.501931410129825, 
    0.501727463569644, 0.501292910105508, 0.501050082380163, 
    0.501014387577858, 0.500612045590814, 0.50007801625305, 1, 
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
    1, 1), .Dim = c(20L, 7L), .Dimnames = list(NULL, c("support", 
    "lhsSupport", "rhsSupport", "confidence", "lift", "loLift", 
    "hiLift")))), .Names = c("rules", "statistics"), class = c("farules", 
"list")), randomWalk = structure(list(rules = list(c("RoSm.weight", 
"RoBi.seasonStrength"), c("MlBi.weight", "RoMe.length", "RoSm.seasonStrength"
), c("RoSm.weight", "RoBi.trendStrength"), c("MlSm.weight", "RoBi.seasonStrength"
), c("MlSm.weight", "RoBi.trendStrength"), c("Sm.weight", "RoBi.trendStrength"
), c("Sm.weight", "RoBi.seasonStrength"), c("VeSm.weight", "RoBi.trendStrength"
), c("ExSm.weight", "RoBi.trendStrength"), c("VeSm.weight", "RoBi.seasonStrength"
), c("RoSm.weight", "RoSm.length"), c("ExSm.weight", "RoBi.seasonStrength"
), c("Bi.weight", "RoMe.length", "RoSm.seasonStrength"), c("MlSm.weight", 
"RoSm.length"), c("RoBi.weight", "RoSm.seasonStrength", "RoMe.skewness", 
"RoMe.varcoef"), c("Sm.weight", "RoSm.length"), c("Bi.weight", 
"Sm.seasonStrength", "Me.kurtosis"), c("VeSm.weight", "RoSm.length"
), c("MlBi.weight", "RoSm.length", "Me.trendStrength", "MlMe.varcoef"
), c("MlBi.weight", "RoSm.seasonStrength", "Me.kurtosis"), c("ExSm.weight", 
"RoSm.length"), c("RoBi.weight", "RoMe.trendStrength", "RoSm.seasonStrength"
), c("VeBi.weight", "Sm.seasonStrength", "Me.kurtosis", "RoMe.varcoef"
), c("RoBi.weight", "MlMe.length", "VeBi.trendStrength", "MlMe.skewness", 
"RoMe.varcoef")), statistics = structure(c(0.224566921591759, 
0.0659464150667191, 0.261324822902679, 0.222632452845573, 0.260210663080215, 
0.259075939655304, 0.220342800021172, 0.257254749536514, 0.255902379751205, 
0.216536402702332, 0.106411054730415, 0.213081210851669, 0.0627845600247383, 
0.106079578399658, 0.0889044180512428, 0.105844430625439, 0.0651981234550476, 
0.105497464537621, 0.0409053936600685, 0.0763381868600845, 0.105233855545521, 
0.0839750096201897, 0.0455291420221329, 0.047197338193655, 0.416412055492401, 
0.122783921658993, 0.488686084747314, 0.416412055492401, 0.488686084747314, 
0.488686084747314, 0.416412055492401, 0.488686084747314, 0.488686084747314, 
0.416412055492401, 0.207743138074875, 0.416412055492401, 0.122783921658993, 
0.207743138074875, 0.174270361661911, 0.207743138074875, 0.128015741705894, 
0.207743138074875, 0.0805896297097206, 0.150658264756203, 0.207743138074875, 
0.166509285569191, 0.0905997455120087, 0.0943116992712021, 0.48637193441391, 
0.343065053224564, 0.48637193441391, 0.483034938573837, 0.483034938573837, 
0.479497849941254, 0.479497849941254, 0.474216759204865, 0.469979465007782, 
0.474216759204865, 0.48637193441391, 0.469979465007782, 0.323587030172348, 
0.483034938573837, 0.361275911331177, 0.479497849941254, 0.323587030172348, 
0.474216759204865, 0.343065053224564, 0.343065053224564, 0.469979465007782, 
0.361275911331177, 0.286436021327972, 0.361275911331177, 0.539290154138817, 
0.537093246214042, 0.53474987534749, 0.534644590398119, 0.532469966307232, 
0.530147977897232, 0.529146063652311, 0.526421270352998, 0.523653911454273, 
0.520005124362407, 0.512224161608951, 0.51170759357508, 0.51134186932968, 
0.510628554967842, 0.51015225540026, 0.509496639004703, 0.509297705002834, 
0.507826470300054, 0.507576394226, 0.506697637753999, 0.506557552373125, 
0.50432628626765, 0.502530572959481, 0.500439908923013, 1, 1, 
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 1, 1, 1, 1, 1), .Dim = c(24L, 7L), .Dimnames = list(NULL, 
    c("support", "lhsSupport", "rhsSupport", "confidence", "lift", 
    "loLift", "hiLift")))), .Names = c("rules", "statistics"), class = c("farules", 
"list")), theta = structure(list(rules = list(c("RoMe.weight", 
"RoBi.trendStrength", "RoSm.skewness"), c("RoBi.weight", "RoMe.length", 
"VeSm.frequency"), c("MlBi.weight", "RoMe.length", "MlSm.frequency"
), c("MlMe.weight", "RoBi.trendStrength", "RoSm.skewness"), c("RoMe.weight", 
"RoBi.trendStrength", "MlSm.seasonStrength"), c("MlMe.weight", 
"RoBi.trendStrength", "Lm.kurtosis", "RoMe.stationarity"), c("Bi.weight", 
"Me.length", "RoBi.stationarity"), c("RoMe.weight", "RoBi.trendStrength", 
"RoMe.stationarity"), c("Bi.weight", "RoMe.length", "MlSm.frequency"
), c("VeBi.weight", "TyMe.length", "RoMe.varcoef", "Sm.frequency"
), c("MlBi.weight", "MlMe.length", "RoMe.varcoef", "Bi.stationarity"
), c("MlSm.weight", "RoBi.length", "ExBi.seasonStrength", "VeBi.stationarity"
), c("Sm.weight", "RoBi.length", "ExBi.seasonStrength", "ExBi.stationarity"
), c("RoSm.weight", "RoBi.length", "ExBi.seasonStrength", "RoBi.stationarity"
), c("MlMe.weight", "RoBi.trendStrength", "RoSm.seasonStrength", 
"MlMe.varcoef"), c("RoMe.weight", "MlSm.length"), c("MlMe.weight", 
"MlSm.length", "RoSm.seasonStrength", "RoMe.varcoef"), c("RoBi.weight", 
"MlMe.length", "RoBi.stationarity"), c("MlMe.weight", "RoSm.skewness", 
"MlMe.stationarity")), statistics = structure(c(0.0795977860689163, 
0.0683234483003616, 0.0657214522361755, 0.0743812620639801, 0.0713092237710953, 
0.0425978824496269, 0.0505145564675331, 0.097224734723568, 0.0636289715766907, 
0.0510660745203495, 0.0458200126886368, 0.0622556991875172, 0.0565291382372379, 
0.0691801458597183, 0.0509533882141113, 0.0996784567832947, 0.0656408816576004, 
0.0591656193137169, 0.0442175418138504, 0.143048137426376, 0.125301763415337, 
0.125301763415337, 0.143048137426376, 0.138769507408142, 0.0834815874695778, 
0.0992694348096848, 0.191260442137718, 0.125301763415337, 0.100566811859608, 
0.0905437469482422, 0.123075395822525, 0.112009219825268, 0.137272104620934, 
0.101157188415527, 0.198065057396889, 0.130448833107948, 0.117652676999569, 
0.0883596837520599, 0.378771752119064, 0.352054685354233, 0.331556618213654, 
0.331179529428482, 0.378771752119064, 0.331179529428482, 0.313356757164001, 
0.378771752119064, 0.313356757164001, 0.279984176158905, 0.331556618213654, 
0.231406345963478, 0.21248422563076, 0.252092212438583, 0.331179529428482, 
0.378771752119064, 0.331179529428482, 0.352054685354233, 0.331179529428482, 
0.556440562603505, 0.545271243102067, 0.524505405549076, 0.51997364944554, 
0.513868104765725, 0.510266799432274, 0.508863141654604, 0.508336871110863, 
0.507805874732826, 0.507782573356688, 0.506053860514841, 0.505833832761261, 
0.504682903116567, 0.50396361337035, 0.503705065475012, 0.50326119151626, 
0.503192555224174, 0.502883749206435, 0.500426664472071, 1, 1, 
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1), .Dim = c(19L, 7L), .Dimnames = list(
    NULL, c("support", "lhsSupport", "rhsSupport", "confidence", 
    "lift", "loLift", "hiLift")))), .Names = c("rules", "statistics"
), class = c("farules", "list"))), .Names = c("arima", "expSmooth", 
"randomWalk", "theta")), featuresContext = structure(list(length = c(0.0014, 
0.0051, 0.01), trendStrength = c(0.00206004820626882, 0.999999999610942, 
1), seasonStrength = c(0, 0.669003044548185, 1), skewness = c(0.583345505164101, 
0.594663576113668, 0.666666666666667), kurtosis = c(0.0114929353310186, 
0.023965898416211, 0.1), varcoef = c(0.00592853945985588, 0.196592940983816, 
1), stationarity = c(0.01, 0.585769170137984, 0.99), frequency = c(0.0833333333333333, 
0.25, 1)), .Names = c("length", "trendStrength", "seasonStrength", 
"skewness", "kurtosis", "varcoef", "stationarity", "frequency"
)), weightContext = structure(list(arima = c(0, 0.786467176063273, 
1), expSmooth = c(0, 0.7747190198609, 1), randomWalk = c(0, 0.071978067472705, 
1), theta = c(0, 0.598630214426157, 1)), .Names = c("arima", 
"expSmooth", "randomWalk", "theta"))), .Names = c("model", "featuresContext", 
"weightContext"))

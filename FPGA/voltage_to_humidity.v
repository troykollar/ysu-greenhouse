module voltage_to_humidity(input wire clk,
                           input wire [11:0] voltage,
                           output reg [9:0]  humidity);

always @(posedge clk)
    if      (voltage <= 12'h7d0)    humidity <= 10'd0;
    else if (voltage <= 12'h7D9)	humidity <=	10'd0;
    else if (voltage <= 12'h7E4)	humidity <=	10'd5;
    else if (voltage <= 12'h7ED)	humidity <=	10'd10;
    else if (voltage <= 12'h7F8)	humidity <=	10'd15;
    else if (voltage <= 12'h802)	humidity <=	10'd20;
    else if (voltage <= 12'h80C)	humidity <=	10'd25;
    else if (voltage <= 12'h816)	humidity <=	10'd30;
    else if (voltage <= 12'h820)	humidity <=	10'd35;
    else if (voltage <= 12'h82A)	humidity <=	10'd40;
    else if (voltage <= 12'h834)	humidity <=	10'd45;
    else if (voltage <= 12'h83E)	humidity <=	10'd50;
    else if (voltage <= 12'h848)	humidity <=	10'd55;
    else if (voltage <= 12'h852)	humidity <=	10'd60;
    else if (voltage <= 12'h85C)	humidity <=	10'd65;
    else if (voltage <= 12'h866)	humidity <=	10'd70;
    else if (voltage <= 12'h870)	humidity <=	10'd75;
    else if (voltage <= 12'h87A)	humidity <=	10'd80;
    else if (voltage <= 12'h884)	humidity <=	10'd85;
    else if (voltage <= 12'h88E)	humidity <=	10'd90;
    else if (voltage <= 12'h898)	humidity <=	10'd95;
    else if (voltage <= 12'h8A2)	humidity <=	10'd100;
    else if (voltage <= 12'h8AC)	humidity <=	10'd105;
    else if (voltage <= 12'h8B6)	humidity <=	10'd110;
    else if (voltage <= 12'h8C0)	humidity <=	10'd115;
    else if (voltage <= 12'h8CA)	humidity <=	10'd120;
    else if (voltage <= 12'h8D4)	humidity <=	10'd125;
    else if (voltage <= 12'h8DE)	humidity <=	10'd130;
    else if (voltage <= 12'h8E8)	humidity <=	10'd135;
    else if (voltage <= 12'h8F2)	humidity <=	10'd140;
    else if (voltage <= 12'h8FC)	humidity <=	10'd145;
    else if (voltage <= 12'h906)	humidity <=	10'd150;
    else if (voltage <= 12'h910)	humidity <=	10'd155;
    else if (voltage <= 12'h91A)	humidity <=	10'd160;
    else if (voltage <= 12'h924)	humidity <=	10'd165;
    else if (voltage <= 12'h92E)	humidity <=	10'd170;
    else if (voltage <= 12'h938)	humidity <=	10'd175;
    else if (voltage <= 12'h942)	humidity <=	10'd180;
    else if (voltage <= 12'h94C)	humidity <=	10'd185;
    else if (voltage <= 12'h956)	humidity <=	10'd190;
    else if (voltage <= 12'h960)	humidity <=	10'd195;
    else if (voltage <= 12'h96A)	humidity <=	10'd200;
    else if (voltage <= 12'h974)	humidity <=	10'd205;
    else if (voltage <= 12'h97E)	humidity <=	10'd210;
    else if (voltage <= 12'h988)	humidity <=	10'd215;
    else if (voltage <= 12'h992)	humidity <=	10'd220;
    else if (voltage <= 12'h99C)	humidity <=	10'd225;
    else if (voltage <= 12'h9A6)	humidity <=	10'd230;
    else if (voltage <= 12'h9B0)	humidity <=	10'd235;
    else if (voltage <= 12'h9BA)	humidity <=	10'd240;
    else if (voltage <= 12'h9C4)	humidity <=	10'd245;
    else if (voltage <= 12'h9CE)	humidity <=	10'd250;
    else if (voltage <= 12'h9D8)	humidity <=	10'd255;
    else if (voltage <= 12'h9E2)	humidity <=	10'd260;
    else if (voltage <= 12'h9EC)	humidity <=	10'd265;
    else if (voltage <= 12'h9F6)	humidity <=	10'd270;
    else if (voltage <= 12'hA00)	humidity <=	10'd275;
    else if (voltage <= 12'hA0A)	humidity <=	10'd280;
    else if (voltage <= 12'hA14)	humidity <=	10'd285;
    else if (voltage <= 12'hA1E)	humidity <=	10'd290;
    else if (voltage <= 12'hA28)	humidity <=	10'd295;
    else if (voltage <= 12'hA32)	humidity <=	10'd300;
    else if (voltage <= 12'hA3C)	humidity <=	10'd305;
    else if (voltage <= 12'hA46)	humidity <=	10'd310;
    else if (voltage <= 12'hA50)	humidity <=	10'd315;
    else if (voltage <= 12'hA5A)	humidity <=	10'd320;
    else if (voltage <= 12'hA64)	humidity <=	10'd325;
    else if (voltage <= 12'hA6E)	humidity <=	10'd330;
    else if (voltage <= 12'hA78)	humidity <=	10'd335;
    else if (voltage <= 12'hA82)	humidity <=	10'd340;
    else if (voltage <= 12'hA8C)	humidity <=	10'd345;
    else if (voltage <= 12'hA96)	humidity <=	10'd350;
    else if (voltage <= 12'hAA0)	humidity <=	10'd355;
    else if (voltage <= 12'hAAA)	humidity <=	10'd360;
    else if (voltage <= 12'hAB4)	humidity <=	10'd365;
    else if (voltage <= 12'hABD)	humidity <=	10'd370;
    else if (voltage <= 12'hAC8)	humidity <=	10'd375;
    else if (voltage <= 12'hAD1)	humidity <=	10'd380;
    else if (voltage <= 12'hADB)	humidity <=	10'd385;
    else if (voltage <= 12'hAE5)	humidity <=	10'd390;
    else if (voltage <= 12'hAEF)	humidity <=	10'd395;
    else if (voltage <= 12'hAF9)	humidity <=	10'd400;
    else if (voltage <= 12'hB03)	humidity <=	10'd405;
    else if (voltage <= 12'hB0D)	humidity <=	10'd410;
    else if (voltage <= 12'hB17)	humidity <=	10'd415;
    else if (voltage <= 12'hB21)	humidity <=	10'd420;
    else if (voltage <= 12'hB2B)	humidity <=	10'd425;
    else if (voltage <= 12'hB35)	humidity <=	10'd430;
    else if (voltage <= 12'hB3F)	humidity <=	10'd435;
    else if (voltage <= 12'hB49)	humidity <=	10'd440;
    else if (voltage <= 12'hB53)	humidity <=	10'd445;
    else if (voltage <= 12'hB5D)	humidity <=	10'd450;
    else if (voltage <= 12'hB67)	humidity <=	10'd455;
    else if (voltage <= 12'hB71)	humidity <=	10'd460;
    else if (voltage <= 12'hB7B)	humidity <=	10'd465;
    else if (voltage <= 12'hB85)	humidity <=	10'd470;
    else if (voltage <= 12'hB8F)	humidity <=	10'd475;
    else if (voltage <= 12'hB99)	humidity <=	10'd480;
    else if (voltage <= 12'hBA3)	humidity <=	10'd485;
    else if (voltage <= 12'hBAD)	humidity <=	10'd490;
    else if (voltage <= 12'hBB7)	humidity <=	10'd495;
    else if (voltage <= 12'hBC1)	humidity <=	10'd500;
    else if (voltage <= 12'hBCB)	humidity <=	10'd505;
    else if (voltage <= 12'hBD5)	humidity <=	10'd510;
    else if (voltage <= 12'hBDF)	humidity <=	10'd515;
    else if (voltage <= 12'hBE9)	humidity <=	10'd520;
    else if (voltage <= 12'hBF3)	humidity <=	10'd525;
    else if (voltage <= 12'hBFD)	humidity <=	10'd530;
    else if (voltage <= 12'hC07)	humidity <=	10'd535;
    else if (voltage <= 12'hC11)	humidity <=	10'd540;
    else if (voltage <= 12'hC1B)	humidity <=	10'd545;
    else if (voltage <= 12'hC25)	humidity <=	10'd550;
    else if (voltage <= 12'hC2F)	humidity <=	10'd555;
    else if (voltage <= 12'hC39)	humidity <=	10'd560;
    else if (voltage <= 12'hC43)	humidity <=	10'd565;
    else if (voltage <= 12'hC4D)	humidity <=	10'd570;
    else if (voltage <= 12'hC57)	humidity <=	10'd575;
    else if (voltage <= 12'hC61)	humidity <=	10'd580;
    else if (voltage <= 12'hC6B)	humidity <=	10'd585;
    else if (voltage <= 12'hC75)	humidity <=	10'd590;
    else if (voltage <= 12'hC7F)	humidity <=	10'd595;
    else if (voltage <= 12'hC89)	humidity <=	10'd600;
    else if (voltage <= 12'hC93)	humidity <=	10'd605;
    else if (voltage <= 12'hC9D)	humidity <=	10'd610;
    else if (voltage <= 12'hCA7)	humidity <=	10'd615;
    else if (voltage <= 12'hCB1)	humidity <=	10'd620;
    else if (voltage <= 12'hCBB)	humidity <=	10'd625;
    else if (voltage <= 12'hCC5)	humidity <=	10'd630;
    else if (voltage <= 12'hCCF)	humidity <=	10'd635;
    else if (voltage <= 12'hCD9)	humidity <=	10'd640;
    else if (voltage <= 12'hCE3)	humidity <=	10'd645;
    else if (voltage <= 12'hCED)	humidity <=	10'd650;
    else if (voltage <= 12'hCF7)	humidity <=	10'd655;
    else if (voltage <= 12'hD01)	humidity <=	10'd660;
    else if (voltage <= 12'hD0B)	humidity <=	10'd665;
    else if (voltage <= 12'hD15)	humidity <=	10'd670;
    else if (voltage <= 12'hD1F)	humidity <=	10'd675;
    else if (voltage <= 12'hD29)	humidity <=	10'd680;
    else if (voltage <= 12'hD33)	humidity <=	10'd685;
    else if (voltage <= 12'hD3D)	humidity <=	10'd690;
    else if (voltage <= 12'hD47)	humidity <=	10'd695;
    else if (voltage <= 12'hD51)	humidity <=	10'd700;
    else if (voltage <= 12'hD5B)	humidity <=	10'd705;
    else if (voltage <= 12'hD65)	humidity <=	10'd710;
    else if (voltage <= 12'hD6F)	humidity <=	10'd715;
    else if (voltage <= 12'hD79)	humidity <=	10'd720;
    else if (voltage <= 12'hD83)	humidity <=	10'd725;
    else if (voltage <= 12'hD8D)	humidity <=	10'd730;
    else if (voltage <= 12'hD97)	humidity <=	10'd735;
    else if (voltage <= 12'hDA1)	humidity <=	10'd740;
    else if (voltage <= 12'hDAB)	humidity <=	10'd745;
    else if (voltage <= 12'hDB5)	humidity <=	10'd750;
    else if (voltage <= 12'hDBF)	humidity <=	10'd755;
    else if (voltage <= 12'hDC9)	humidity <=	10'd760;
    else if (voltage <= 12'hDD3)	humidity <=	10'd765;
    else if (voltage <= 12'hDDD)	humidity <=	10'd770;
    else if (voltage <= 12'hDE7)	humidity <=	10'd775;
    else if (voltage <= 12'hDF1)	humidity <=	10'd780;
    else if (voltage <= 12'hDFB)	humidity <=	10'd785;
    else if (voltage <= 12'hE05)	humidity <=	10'd790;
    else if (voltage <= 12'hE0F)	humidity <=	10'd795;
    else if (voltage <= 12'hE19)	humidity <=	10'd800;
    else if (voltage <= 12'hE23)	humidity <=	10'd805;
    else if (voltage <= 12'hE2D)	humidity <=	10'd810;
    else if (voltage <= 12'hE37)	humidity <=	10'd815;
    else if (voltage <= 12'hE41)	humidity <=	10'd820;
    else if (voltage <= 12'hE4B)	humidity <=	10'd825;
    else if (voltage <= 12'hE55)	humidity <=	10'd830;
    else if (voltage <= 12'hE5F)	humidity <=	10'd835;
    else if (voltage <= 12'hE69)	humidity <=	10'd840;
    else if (voltage <= 12'hE73)	humidity <=	10'd845;
    else if (voltage <= 12'hE7D)	humidity <=	10'd850;
    else if (voltage <= 12'hE87)	humidity <=	10'd855;
    else if (voltage <= 12'hE91)	humidity <=	10'd860;
    else if (voltage <= 12'hE9B)	humidity <=	10'd865;
    else if (voltage <= 12'hEA5)	humidity <=	10'd870;
    else if (voltage <= 12'hEAF)	humidity <=	10'd875;
    else if (voltage <= 12'hEB9)	humidity <=	10'd880;
    else if (voltage <= 12'hEC3)	humidity <=	10'd885;
    else if (voltage <= 12'hECD)	humidity <=	10'd890;
    else if (voltage <= 12'hED7)	humidity <=	10'd895;
    else if (voltage <= 12'hEE1)	humidity <=	10'd900;
    else if (voltage <= 12'hEEB)	humidity <=	10'd905;
    else if (voltage <= 12'hEF5)	humidity <=	10'd910;
    else if (voltage <= 12'hEFF)	humidity <=	10'd915;
    else if (voltage <= 12'hF09)	humidity <=	10'd920;
    else if (voltage <= 12'hF13)	humidity <=	10'd925;
    else if (voltage <= 12'hF1D)	humidity <=	10'd930;
    else if (voltage <= 12'hF27)	humidity <=	10'd935;
    else if (voltage <= 12'hF31)	humidity <=	10'd940;
    else if (voltage <= 12'hF3B)	humidity <=	10'd945;
    else if (voltage <= 12'hF45)	humidity <=	10'd950;
    else if (voltage <= 12'hF4F)	humidity <=	10'd955;
    else if (voltage <= 12'hF59)	humidity <=	10'd960;
    else if (voltage <= 12'hF63)	humidity <=	10'd965;
    else if (voltage <= 12'hF6D)	humidity <=	10'd970;
    else if (voltage <= 12'hF77)	humidity <=	10'd975;
    else if (voltage <= 12'hF81)	humidity <=	10'd980;
    else if (voltage <= 12'hF8B)	humidity <=	10'd985;
    else if (voltage <= 12'hF95)	humidity <=	10'd990;
    else if (voltage <= 12'hF9F)	humidity <=	10'd995;
    else if (voltage <= 12'hFFF)	humidity <=	10'd1000;
    else                            humidity <= 10'd0;

endmodule
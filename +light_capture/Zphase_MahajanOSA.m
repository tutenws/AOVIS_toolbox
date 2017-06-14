function phasemap=Zphase_Mahajan(c)

% WARNING: 	The Zernike polynomials are normalized and ordered after Mahajan.
%           Applied Optics 33: 8121-8124 (1994)
%				Be careful that your coefficients match the list of polynomials that you use.
%				The terms are ordered so that the sine expressions are always odd.

global PARAMS;

phasemap = zeros(PARAMS(1),PARAMS(1));

sizeoffield=PARAMS(4);

PARAMS(6) = 0;
%*********************************************************************************************
%******************** Parameters for Stiles_Crawford reflectance (From Burns et al)***********
B=0.2;%fraction if the diffuse component;
A=1-B;%fraction of directed component;
peakx=0;%normalized location of peak reflectance in x-direction
peaky=0;%normalized location of peak reflectance in x-direction
p=0;%0.047%set to zero to turn off the amplitude factor (Values from Burns et al in mm^(-2)
%*********************************************************************************************

for ny = 1:PARAMS(1)

	for nx = 1:PARAMS(1)

		xpos = ((nx-1)*(sizeoffield/PARAMS(1))-(sizeoffield/2));
		ypos = ((ny-1)*(sizeoffield/PARAMS(1))-(sizeoffield/2));

      [angle norm_radius]=cart2pol(xpos,ypos);
      norm_radius=norm_radius/(PARAMS(3)/2);
      r=norm_radius;
		%norm_radius = (sqrt(xpos^2+ypos^2))/(PARAMS(3)/2);

		%if (ypos==0 & xpos>0)
		%	angle = 3.1416/2;
		%elseif(ypos==0 & xpos<0)
		%	angle = -3.1416/2;
		%elseif(xpos==0 & ypos==0)
		%	angle = 0;
		%elseif(ypos>0)
		%	angle = atan(xpos/ypos);
		%else
		%	angle= 3.1416 + atan(xpos/ypos);
		%end

	if norm_radius > PARAMS(2)/PARAMS(3)
			waveabermap(nx,ny)=NaN;
	else
			phase = 0;
			phase = ...   
            c(1)*sqrt(4)*((1)*r^1)*sin(1*angle) + ...
            c(2)*sqrt(4)*((1)*r^1)*cos(1*angle) + ...
            c(3)*sqrt(6)*((1)*r^2)*sin(2*angle) + ...
            c(4)*sqrt(3)*((2)*r^2+(-1)*r^0) + ...
            c(5)*sqrt(6)*((1)*r^2)*cos(2*angle) + ...
            c(6)*sqrt(8)*((1)*r^3)*sin(3*angle) + ...
            c(7)*sqrt(8)*((3)*r^3+(-2)*r^1)*sin(1*angle) + ...
            c(8)*sqrt(8)*((3)*r^3+(-2)*r^1)*cos(1*angle) + ...
            c(9)*sqrt(8)*((1)*r^3)*cos(3*angle) + ...
            c(10)*sqrt(10)*((1)*r^4)*sin(4*angle) + ...
            c(11)*sqrt(10)*((4)*r^4+(-3)*r^2)*sin(2*angle) + ...
            c(12)*sqrt(5)*((6)*r^4+(-6)*r^2+(1)*r^0) + ...
            c(13)*sqrt(10)*((4)*r^4+(-3)*r^2)*cos(2*angle) + ...
            c(14)*sqrt(10)*((1)*r^4)*cos(4*angle) + ...
            c(15)*sqrt(12)*((1)*r^5)*sin(5*angle) + ...
            c(16)*sqrt(12)*((5)*r^5+(-4)*r^3)*sin(3*angle) + ...
            c(17)*sqrt(12)*((10)*r^5+(-12)*r^3+(3)*r^1)*sin(1*angle) + ...
            c(18)*sqrt(12)*((10)*r^5+(-12)*r^3+(3)*r^1)*cos(1*angle) + ...
            c(19)*sqrt(12)*((5)*r^5+(-4)*r^3)*cos(3*angle) + ...
            c(20)*sqrt(12)*((1)*r^5)*cos(5*angle) + ...
            c(21)*sqrt(14)*((1)*r^6)*sin(6*angle) + ...
            c(22)*sqrt(14)*((6)*r^6+(-5)*r^4)*sin(4*angle) + ...
            c(23)*sqrt(14)*((15)*r^6+(-20)*r^4+(6)*r^2)*sin(2*angle) + ...
            c(24)*sqrt(7)*((20)*r^6+(-30)*r^4+(12)*r^2+(-1)*r^0) + ...
            c(25)*sqrt(14)*((15)*r^6+(-20)*r^4+(6)*r^2)*cos(2*angle) + ...
            c(26)*sqrt(14)*((6)*r^6+(-5)*r^4)*cos(4*angle) + ...
            c(27)*sqrt(14)*((1)*r^6)*cos(6*angle) + ...
            c(28)*sqrt(16)*((1)*r^7)*sin(7*angle) + ...
            c(29)*sqrt(16)*((7)*r^7+(-6)*r^5)*sin(5*angle) + ...
            c(30)*sqrt(16)*((21)*r^7+(-30)*r^5+(10)*r^3)*sin(3*angle) + ...
            c(31)*sqrt(16)*((35)*r^7+(-60)*r^5+(30)*r^3+(-4)*r^1)*sin(1*angle) + ...
            c(32)*sqrt(16)*((35)*r^7+(-60)*r^5+(30)*r^3+(-4)*r^1)*cos(1*angle) + ...
            c(33)*sqrt(16)*((21)*r^7+(-30)*r^5+(10)*r^3)*cos(3*angle) + ...
            c(34)*sqrt(16)*((7)*r^7+(-6)*r^5)*cos(5*angle) + ...
            c(35)*sqrt(16)*((1)*r^7)*cos(7*angle) + ...
            c(36)*sqrt(18)*((1)*r^8)*sin(8*angle) + ...
            c(37)*sqrt(18)*((8)*r^8+(-7)*r^6)*sin(6*angle) + ...
            c(38)*sqrt(18)*((28)*r^8+(-42)*r^6+(15)*r^4)*sin(4*angle) + ...
            c(39)*sqrt(18)*((56)*r^8+(-105)*r^6+(60)*r^4+(-10)*r^2)*sin(2*angle) + ...
            c(40)*sqrt(9)*((70)*r^8+(-140)*r^6+(90)*r^4+(-20)*r^2+(1)*r^0) + ...
            c(41)*sqrt(18)*((56)*r^8+(-105)*r^6+(60)*r^4+(-10)*r^2)*cos(2*angle) + ...
            c(42)*sqrt(18)*((28)*r^8+(-42)*r^6+(15)*r^4)*cos(4*angle) + ...
            c(43)*sqrt(18)*((8)*r^8+(-7)*r^6)*cos(6*angle) + ...
            c(44)*sqrt(18)*((1)*r^8)*cos(8*angle) + ...
            c(45)*sqrt(20)*((1)*r^9)*sin(9*angle) + ...
            c(46)*sqrt(20)*((9)*r^9+(-8)*r^7)*sin(7*angle) + ...
            c(47)*sqrt(20)*((36)*r^9+(-56)*r^7+(21)*r^5)*sin(5*angle) + ...
            c(48)*sqrt(20)*((84)*r^9+(-168)*r^7+(105)*r^5+(-20)*r^3)*sin(3*angle) + ...
            c(49)*sqrt(20)*((126)*r^9+(-280)*r^7+(210)*r^5+(-60)*r^3+(5)*r^1)*sin(1*angle) + ...
            c(50)*sqrt(20)*((126)*r^9+(-280)*r^7+(210)*r^5+(-60)*r^3+(5)*r^1)*cos(1*angle) + ...
            c(51)*sqrt(20)*((84)*r^9+(-168)*r^7+(105)*r^5+(-20)*r^3)*cos(3*angle) + ...
            c(52)*sqrt(20)*((36)*r^9+(-56)*r^7+(21)*r^5)*cos(5*angle) + ...
            c(53)*sqrt(20)*((9)*r^9+(-8)*r^7)*cos(7*angle) + ...
            c(54)*sqrt(20)*((1)*r^9)*cos(9*angle) + ...
            c(55)*sqrt(22)*((1)*r^10)*sin(10*angle) + ...
            c(56)*sqrt(22)*((10)*r^10+(-9)*r^8)*sin(8*angle) + ...
            c(57)*sqrt(22)*((45)*r^10+(-72)*r^8+(28)*r^6)*sin(6*angle) + ...
            c(58)*sqrt(22)*((120)*r^10+(-252)*r^8+(168)*r^6+(-35)*r^4)*sin(4*angle) + ...
            c(59)*sqrt(22)*((210)*r^10+(-504)*r^8+(420)*r^6+(-140)*r^4+(15)*r^2)*sin(2*angle) + ...
            c(60)*sqrt(11)*((252)*r^10+(-630)*r^8+(560)*r^6+(-210)*r^4+(30)*r^2+(-1)*r^0) + ...
            c(61)*sqrt(22)*((210)*r^10+(-504)*r^8+(420)*r^6+(-140)*r^4+(15)*r^2)*cos(2*angle) + ...
            c(62)*sqrt(22)*((120)*r^10+(-252)*r^8+(168)*r^6+(-35)*r^4)*cos(4*angle) + ...
            c(63)*sqrt(22)*((45)*r^10+(-72)*r^8+(28)*r^6)*cos(6*angle) + ...
            c(64)*sqrt(22)*((10)*r^10+(-9)*r^8)*cos(8*angle) + ...
            c(65)*sqrt(22)*((1)*r^10)*cos(10*angle);

      
         d=sqrt((peakx-xpos)^2+(peaky-ypos)^2);
         SCfactor=B+A*10^(-p*(PARAMS(2)^2)*d^2);
      
      	phasemap(nx,ny) = SCfactor * exp(-i * 2 * 3.1416 * phase/PARAMS(5));
			PARAMS(6) = PARAMS(6) + 1;
		end
	end
end

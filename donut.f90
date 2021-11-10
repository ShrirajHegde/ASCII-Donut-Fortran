program donut
    implicit none
    INTEGER::k
    real,PARAMETER::scale=1
    real,PARAMETER::speed=1
    INTEGER,PARAMETER::height=int(scale*80)
    INTEGER,PARAMETER::width=int(scale*22)
    real::angle_x=0,angle_y=0,theta,phi,z_buffer(width*height)
    CHARACTER:: screen(width*height)
    real,PARAMETER::TAU=3.14159*2
    CHARACTER(len=12):: ATABLE=".,-~:;=!*#$@"
    real::sinphi,costheta,sinax,sintheta,cosax,cosjthetap2,mess
    real::cosphi,cosay,t,sinay
    INTEGER::x,y,o,lum
    CHARACTER::ASCII10=achar(10)
    CHARACTER::ESC=achar(27)
    REAL::fps=0, ti,tf
    INTEGER::count, rate, cmax

    write(*,"(A)",advance="no")ESC//"[2J"

    do while(.true.)

        call system_clock(count,rate,cmax)
        ti=float(count)/rate

        z_buffer=0.0
        screen=" "
        theta=0.0
        do while(theta<TAU)
            phi=0.0
            do while(phi<TAU)
                sinphi=sin(phi)
                costheta=cos(theta)
                cosjthetap2=costheta+2
                sinax=sin(angle_x)
                sintheta=sin(theta)
                cosax=cos(angle_x)
                cosphi=cos(phi)
                cosay=cos(angle_y)
                sinay=sin(angle_y)
                mess=1.00/(sinphi*cosjthetap2*sinax+sintheta*cosax+5)
                t=sinphi*cosjthetap2*cosax - sintheta*sinax;
                x=int(40*scale+scale*30*mess*(cosphi*cosjthetap2*cosay-t*sinay))
                y=int(scale*12+scale*15*mess*(cosphi*cosjthetap2*sinay+t*cosay))
                o=x+height*y
                lum=int(8*((sintheta*sinax-sinphi*costheta*cosax)* &
                        cosay-sinphi*costheta*sinax-sintheta*cosax-cosphi *costheta*sinay))
                if(width>y .and. y>0 .and. x>0 .and. height>x .and. mess>z_buffer(o))then
                    z_buffer(o)=mess
                    if (lum>0)then
                        screen(o)=ATABLE(lum:lum) 
                    else
                        screen(o)="."
                    endif
                endif
                phi=phi+0.02
            enddo
            theta=theta+0.07
        enddo
        
        write(0,"(A,F8.3)",advance="no")"FPS = ",fps

        ! Write a newline to make ifort compiled binary to flush the buffer
        print*," "

        write(*,"(A)",advance="no")ESC//"[d"
        
        do k=1,width*height
            if(mod(k,height)==0)then
                write(*,"(A)",advance="no")ASCII10
            else
                write(*,"(A)",advance="no")screen(k)
            endif
        enddo
        angle_x=angle_x+0.04*speed
        angle_y=angle_y+0.04*speed
        
        call system_clock(count,rate,cmax)
        tf=float(count)/rate
        fps=1.00/(tf-ti)
    enddo
end program donut

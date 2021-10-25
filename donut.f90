program donut
    implicit none
    INTEGER::k
    real,PARAMETER::scale=1
    real,PARAMETER::speed=0.7
    INTEGER,PARAMETER::height=scale*80
    INTEGER,PARAMETER::width=scale*22
    real::a=0,b=0,j,i,z(width*height)
    CHARACTER:: screen(width*height)
    real,PARAMETER::TAU=3.14159*2
    CHARACTER:: ATABLE*12=".,-~:;=!*#$@"
    ! INTEGER::la
    real::sini,cosj,sina,sinj,cosa,cosj2,mess
    real::cosi,cosb,t,sinb
    INTEGER::x,y,o,N
    CHARACTER::ASCII10=achar(10)

    ! ESC or box in the next line is the ASCII character 27 (escape)
    write(*,"(A)",advance="no")"[2J"

    do while(.true.)
        z=0
        screen=" "
        j=0
        do while(j<TAU)
            i=0
            do while(i<TAU)
                sini=sin(i)
                cosj=cos(j)
                cosj2=cosj+2
                sina=sin(a)
                sinj=sin(j)
                cosa=cos(a)
                cosi=cos(i)
                cosb=cos(b)
                sinb=sin(b)
                mess=1.00/(sini*cosj2*sinA+sinj*cosA+5)
                t=sini*cosj2*cosa - sinj*sina;
                x=40*scale+scale*30*mess*(cosi*cosj2*cosB-t*sinB)
                y= scale*12+scale*15*mess*(cosi*cosj2*sinB +t*cosB)
                o=x+height*y
                N=int(8*((sinj*sina-sini*cosj*cosa)*cosb-sini*cosj*sina-sinj*cosa-cosi *cosj*sinb))
                if(width>y .and. y>0 .and. x>0 .and. height>x .and. mess>z(o))then
                    z(o)=mess
                    if (N>0)then
                        screen(o)=ATABLE(N:N) 
                    else
                        screen(o)="."
                    endif
                endif
                i=i+0.02
            enddo
            j=j+0.07
        enddo

        write(*,"(A)",advance="no")"[d"
        
        do k=0,width*height+1
            if(mod(k,height)==0)then
                write(*,"(A)",advance="no")ASCII10
            else
                write(*,"(A)",advance="no")screen(k)
            endif
        enddo
        a=a+0.04*speed
        b=b+0.04*speed
    enddo
end program donut
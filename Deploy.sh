#!/bin/zsh

main()
{
    echo "Coloque o caminho do Dockerfile"
    read _rout;

    echo "Escolha uma opção:"
    echo "1 - Docker Build"
    echo "2 - Deploy heroku"
    echo "0 - Sair"
    read _opcao;
    case $_opcao in;
        "1")
            dockerBuild
            ;;
        "2")
            deployHeroku
            ;;
        "0")
            sair
            ;;
    esac
}

dockerBuild()
{
    cd $_rout
    sudo docker build .
}

deployHeroku()
{
    cd $_rout

    heroku login
    echo "Login feito com sucesso"
    echo ""

    sudo heroku container:login
    echo "" 
    echo "Login no container feito com sucesso"
    echo ""

    sudo heroku container:push web -a ecceope2
    echo ""
    echo "Push feito com sucesso"
    echo ""

    sudo heroku container:release web -a ecceope2
    echo ""
    echo "Deploy feito com sucesso"
}  

sair()
{
    exit
}  
main

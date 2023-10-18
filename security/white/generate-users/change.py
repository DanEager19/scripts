with open('users.txt', 'r') as fp:
    main = ''
    for line in fp:
        name = line.split(' ')
        main +=f'{name[0].lower()}{name[1].lower()}\n'

with open('users-unix.txt', 'w+') as fp:
    fp.write(main)
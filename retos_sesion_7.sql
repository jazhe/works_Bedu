CREATE TABLE IF NOT EXISTS users(
    user_id INT PRIMARY KEY,
    Genero CHAR(1),
    Edad INT,
    Ocupacion INT,
    cp VARCHAR(20)
);

/*Reto 1
movie_id::Titulo::Generos*/
CREATE TABLE IF NOT EXISTS movies(
    movie_id INT PRIMARY KEY,
    Titulo VARCHAR(100),
    Generos VARCHAR(50)
);

/*user_id::movie_id::Rating::Tiempo*/
CREATE TABLE IF NOT EXISTS ratings(
    rating_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
    user_id INT,
    movie_id INT,
    Rating CHAR(1),
    Tiempo INT
);



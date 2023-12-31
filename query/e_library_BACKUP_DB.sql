PGDMP                         {         	   e_library    15.4    15.4 c    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    20555 	   e_library    DATABASE     k   CREATE DATABASE e_library WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE e_library;
                postgres    false            �            1259    20557    authors    TABLE     j   CREATE TABLE public.authors (
    author_id integer NOT NULL,
    name character varying(100) NOT NULL
);
    DROP TABLE public.authors;
       public         heap    postgres    false            �            1259    20556    authors_author_id_seq    SEQUENCE     �   CREATE SEQUENCE public.authors_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.authors_author_id_seq;
       public          postgres    false    215            �           0    0    authors_author_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.authors_author_id_seq OWNED BY public.authors.author_id;
          public          postgres    false    214            �            1259    20617    book_authors    TABLE     c   CREATE TABLE public.book_authors (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);
     DROP TABLE public.book_authors;
       public         heap    postgres    false            �            1259    20630    book_genres    TABLE     a   CREATE TABLE public.book_genres (
    genre_id integer NOT NULL,
    book_id integer NOT NULL
);
    DROP TABLE public.book_genres;
       public         heap    postgres    false            �            1259    20602    books    TABLE     �   CREATE TABLE public.books (
    book_id integer NOT NULL,
    title character varying(225) NOT NULL,
    isbn character varying(100),
    synopsis text,
    publisher_id integer,
    year smallint
);
    DROP TABLE public.books;
       public         heap    postgres    false            �            1259    20601    books_book_id_seq    SEQUENCE     �   CREATE SEQUENCE public.books_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.books_book_id_seq;
       public          postgres    false    225            �           0    0    books_book_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.books_book_id_seq OWNED BY public.books.book_id;
          public          postgres    false    224            �            1259    20679    borrows    TABLE     �  CREATE TABLE public.borrows (
    borrow_id integer NOT NULL,
    user_id integer NOT NULL,
    lib_book_id integer NOT NULL,
    taken_time timestamp without time zone NOT NULL,
    due_time timestamp without time zone NOT NULL,
    return_time timestamp without time zone,
    CONSTRAINT check_due_time CHECK ((due_time = (taken_time + '14 days'::interval))),
    CONSTRAINT check_return_time CHECK (((return_time IS NULL) OR (return_time >= taken_time)))
);
    DROP TABLE public.borrows;
       public         heap    postgres    false            �            1259    20678    borrows_borrow_id_seq    SEQUENCE     �   CREATE SEQUENCE public.borrows_borrow_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.borrows_borrow_id_seq;
       public          postgres    false    233            �           0    0    borrows_borrow_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.borrows_borrow_id_seq OWNED BY public.borrows.borrow_id;
          public          postgres    false    232            �            1259    20566    genres    TABLE     h   CREATE TABLE public.genres (
    genre_id integer NOT NULL,
    genre character varying(50) NOT NULL
);
    DROP TABLE public.genres;
       public         heap    postgres    false            �            1259    20565    genres_genre_id_seq    SEQUENCE     �   CREATE SEQUENCE public.genres_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.genres_genre_id_seq;
       public          postgres    false    217            �           0    0    genres_genre_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.genres_genre_id_seq OWNED BY public.genres.genre_id;
          public          postgres    false    216            �            1259    20698    hold    TABLE     0  CREATE TABLE public.hold (
    hold_id integer NOT NULL,
    user_id integer NOT NULL,
    lib_book_id integer NOT NULL,
    hold_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone,
    CONSTRAINT check_end_time CHECK (((end_time IS NULL) OR (end_time >= hold_time)))
);
    DROP TABLE public.hold;
       public         heap    postgres    false            �            1259    20697    hold_hold_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hold_hold_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.hold_hold_id_seq;
       public          postgres    false    235            �           0    0    hold_hold_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.hold_hold_id_seq OWNED BY public.hold.hold_id;
          public          postgres    false    234            �            1259    20584 	   libraries    TABLE     i   CREATE TABLE public.libraries (
    lib_id integer NOT NULL,
    name character varying(225) NOT NULL
);
    DROP TABLE public.libraries;
       public         heap    postgres    false            �            1259    20583    libraries_lib_id_seq    SEQUENCE     �   CREATE SEQUENCE public.libraries_lib_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.libraries_lib_id_seq;
       public          postgres    false    221            �           0    0    libraries_lib_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.libraries_lib_id_seq OWNED BY public.libraries.lib_id;
          public          postgres    false    220            �            1259    20644    library_books    TABLE     �   CREATE TABLE public.library_books (
    lib_book_id integer NOT NULL,
    lib_id integer NOT NULL,
    book_id integer NOT NULL,
    availability integer NOT NULL,
    CONSTRAINT c_availability CHECK ((availability >= 0))
);
 !   DROP TABLE public.library_books;
       public         heap    postgres    false            �            1259    20643    library_books_lib_book_id_seq    SEQUENCE     �   CREATE SEQUENCE public.library_books_lib_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.library_books_lib_book_id_seq;
       public          postgres    false    229            �           0    0    library_books_lib_book_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.library_books_lib_book_id_seq OWNED BY public.library_books.lib_book_id;
          public          postgres    false    228            �            1259    20575 
   publishers    TABLE     p   CREATE TABLE public.publishers (
    publisher_id integer NOT NULL,
    name character varying(225) NOT NULL
);
    DROP TABLE public.publishers;
       public         heap    postgres    false            �            1259    20574    publishers_publisher_id_seq    SEQUENCE     �   CREATE SEQUENCE public.publishers_publisher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.publishers_publisher_id_seq;
       public          postgres    false    219            �           0    0    publishers_publisher_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.publishers_publisher_id_seq OWNED BY public.publishers.publisher_id;
          public          postgres    false    218            �            1259    20662    reviews    TABLE     �   CREATE TABLE public.reviews (
    review_id integer NOT NULL,
    book_id integer NOT NULL,
    user_id integer NOT NULL,
    rating smallint NOT NULL
);
    DROP TABLE public.reviews;
       public         heap    postgres    false            �            1259    20661    reviews_review_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reviews_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.reviews_review_id_seq;
       public          postgres    false    231            �           0    0    reviews_review_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.reviews_review_id_seq OWNED BY public.reviews.review_id;
          public          postgres    false    230            �            1259    20593    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone_number character varying(50) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    20592    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    223            �           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    222            �           2604    20560    authors author_id    DEFAULT     v   ALTER TABLE ONLY public.authors ALTER COLUMN author_id SET DEFAULT nextval('public.authors_author_id_seq'::regclass);
 @   ALTER TABLE public.authors ALTER COLUMN author_id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    20605    books book_id    DEFAULT     n   ALTER TABLE ONLY public.books ALTER COLUMN book_id SET DEFAULT nextval('public.books_book_id_seq'::regclass);
 <   ALTER TABLE public.books ALTER COLUMN book_id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    20682    borrows borrow_id    DEFAULT     v   ALTER TABLE ONLY public.borrows ALTER COLUMN borrow_id SET DEFAULT nextval('public.borrows_borrow_id_seq'::regclass);
 @   ALTER TABLE public.borrows ALTER COLUMN borrow_id DROP DEFAULT;
       public          postgres    false    233    232    233            �           2604    20569    genres genre_id    DEFAULT     r   ALTER TABLE ONLY public.genres ALTER COLUMN genre_id SET DEFAULT nextval('public.genres_genre_id_seq'::regclass);
 >   ALTER TABLE public.genres ALTER COLUMN genre_id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    20701    hold hold_id    DEFAULT     l   ALTER TABLE ONLY public.hold ALTER COLUMN hold_id SET DEFAULT nextval('public.hold_hold_id_seq'::regclass);
 ;   ALTER TABLE public.hold ALTER COLUMN hold_id DROP DEFAULT;
       public          postgres    false    235    234    235            �           2604    20587    libraries lib_id    DEFAULT     t   ALTER TABLE ONLY public.libraries ALTER COLUMN lib_id SET DEFAULT nextval('public.libraries_lib_id_seq'::regclass);
 ?   ALTER TABLE public.libraries ALTER COLUMN lib_id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    20647    library_books lib_book_id    DEFAULT     �   ALTER TABLE ONLY public.library_books ALTER COLUMN lib_book_id SET DEFAULT nextval('public.library_books_lib_book_id_seq'::regclass);
 H   ALTER TABLE public.library_books ALTER COLUMN lib_book_id DROP DEFAULT;
       public          postgres    false    229    228    229            �           2604    20578    publishers publisher_id    DEFAULT     �   ALTER TABLE ONLY public.publishers ALTER COLUMN publisher_id SET DEFAULT nextval('public.publishers_publisher_id_seq'::regclass);
 F   ALTER TABLE public.publishers ALTER COLUMN publisher_id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    20665    reviews review_id    DEFAULT     v   ALTER TABLE ONLY public.reviews ALTER COLUMN review_id SET DEFAULT nextval('public.reviews_review_id_seq'::regclass);
 @   ALTER TABLE public.reviews ALTER COLUMN review_id DROP DEFAULT;
       public          postgres    false    231    230    231            �           2604    20596    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    222    223    223            p          0    20557    authors 
   TABLE DATA           2   COPY public.authors (author_id, name) FROM stdin;
    public          postgres    false    215   �p       {          0    20617    book_authors 
   TABLE DATA           :   COPY public.book_authors (book_id, author_id) FROM stdin;
    public          postgres    false    226   �z       |          0    20630    book_genres 
   TABLE DATA           8   COPY public.book_genres (genre_id, book_id) FROM stdin;
    public          postgres    false    227   j       z          0    20602    books 
   TABLE DATA           S   COPY public.books (book_id, title, isbn, synopsis, publisher_id, year) FROM stdin;
    public          postgres    false    225   Օ       �          0    20679    borrows 
   TABLE DATA           e   COPY public.borrows (borrow_id, user_id, lib_book_id, taken_time, due_time, return_time) FROM stdin;
    public          postgres    false    233   kp      r          0    20566    genres 
   TABLE DATA           1   COPY public.genres (genre_id, genre) FROM stdin;
    public          postgres    false    217    �      �          0    20698    hold 
   TABLE DATA           R   COPY public.hold (hold_id, user_id, lib_book_id, hold_time, end_time) FROM stdin;
    public          postgres    false    235   z�      v          0    20584 	   libraries 
   TABLE DATA           1   COPY public.libraries (lib_id, name) FROM stdin;
    public          postgres    false    221   ?      ~          0    20644    library_books 
   TABLE DATA           S   COPY public.library_books (lib_book_id, lib_id, book_id, availability) FROM stdin;
    public          postgres    false    229   ~      t          0    20575 
   publishers 
   TABLE DATA           8   COPY public.publishers (publisher_id, name) FROM stdin;
    public          postgres    false    219   ;       �          0    20662    reviews 
   TABLE DATA           F   COPY public.reviews (review_id, book_id, user_id, rating) FROM stdin;
    public          postgres    false    231   �&      x          0    20593    users 
   TABLE DATA           C   COPY public.users (user_id, name, email, phone_number) FROM stdin;
    public          postgres    false    223   �1      �           0    0    authors_author_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.authors_author_id_seq', 1, false);
          public          postgres    false    214            �           0    0    books_book_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.books_book_id_seq', 1, false);
          public          postgres    false    224            �           0    0    borrows_borrow_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.borrows_borrow_id_seq', 1, false);
          public          postgres    false    232            �           0    0    genres_genre_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.genres_genre_id_seq', 1, false);
          public          postgres    false    216            �           0    0    hold_hold_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.hold_hold_id_seq', 1, false);
          public          postgres    false    234            �           0    0    libraries_lib_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.libraries_lib_id_seq', 1, false);
          public          postgres    false    220            �           0    0    library_books_lib_book_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.library_books_lib_book_id_seq', 1, false);
          public          postgres    false    228            �           0    0    publishers_publisher_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.publishers_publisher_id_seq', 1, false);
          public          postgres    false    218            �           0    0    reviews_review_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.reviews_review_id_seq', 1, false);
          public          postgres    false    230            �           0    0    users_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);
          public          postgres    false    222            �           2606    20562    authors authors_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);
 >   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_pkey;
       public            postgres    false    215            �           2606    20609    books books_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public            postgres    false    225            �           2606    20686    borrows borrows_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.borrows
    ADD CONSTRAINT borrows_pkey PRIMARY KEY (borrow_id);
 >   ALTER TABLE ONLY public.borrows DROP CONSTRAINT borrows_pkey;
       public            postgres    false    233            �           2606    20571    genres genres_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);
 <   ALTER TABLE ONLY public.genres DROP CONSTRAINT genres_pkey;
       public            postgres    false    217            �           2606    20704    hold hold_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.hold
    ADD CONSTRAINT hold_pkey PRIMARY KEY (hold_id);
 8   ALTER TABLE ONLY public.hold DROP CONSTRAINT hold_pkey;
       public            postgres    false    235            �           2606    20589    libraries libraries_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.libraries
    ADD CONSTRAINT libraries_pkey PRIMARY KEY (lib_id);
 B   ALTER TABLE ONLY public.libraries DROP CONSTRAINT libraries_pkey;
       public            postgres    false    221            �           2606    20650     library_books library_books_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.library_books
    ADD CONSTRAINT library_books_pkey PRIMARY KEY (lib_book_id);
 J   ALTER TABLE ONLY public.library_books DROP CONSTRAINT library_books_pkey;
       public            postgres    false    229            �           2606    20580    publishers publishers_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.publishers
    ADD CONSTRAINT publishers_pkey PRIMARY KEY (publisher_id);
 D   ALTER TABLE ONLY public.publishers DROP CONSTRAINT publishers_pkey;
       public            postgres    false    219            �           2606    20667    reviews reviews_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            postgres    false    231            �           2606    20564    authors u_author_name 
   CONSTRAINT     P   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT u_author_name UNIQUE (name);
 ?   ALTER TABLE ONLY public.authors DROP CONSTRAINT u_author_name;
       public            postgres    false    215            �           2606    20573    genres u_genre 
   CONSTRAINT     J   ALTER TABLE ONLY public.genres
    ADD CONSTRAINT u_genre UNIQUE (genre);
 8   ALTER TABLE ONLY public.genres DROP CONSTRAINT u_genre;
       public            postgres    false    217            �           2606    20611    books u_isbn 
   CONSTRAINT     G   ALTER TABLE ONLY public.books
    ADD CONSTRAINT u_isbn UNIQUE (isbn);
 6   ALTER TABLE ONLY public.books DROP CONSTRAINT u_isbn;
       public            postgres    false    225            �           2606    20591    libraries u_libraries_name 
   CONSTRAINT     U   ALTER TABLE ONLY public.libraries
    ADD CONSTRAINT u_libraries_name UNIQUE (name);
 D   ALTER TABLE ONLY public.libraries DROP CONSTRAINT u_libraries_name;
       public            postgres    false    221            �           2606    20582    publishers u_publishers_name 
   CONSTRAINT     W   ALTER TABLE ONLY public.publishers
    ADD CONSTRAINT u_publishers_name UNIQUE (name);
 F   ALTER TABLE ONLY public.publishers DROP CONSTRAINT u_publishers_name;
       public            postgres    false    219            �           2606    20600    users u_users 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT u_users UNIQUE (email, phone_number);
 7   ALTER TABLE ONLY public.users DROP CONSTRAINT u_users;
       public            postgres    false    223    223            �           2606    20598    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    223            �           1259    20716 
   idx_author    INDEX     >   CREATE INDEX idx_author ON public.authors USING btree (name);
    DROP INDEX public.idx_author;
       public            postgres    false    215            �           1259    20715    idx_book_title    INDEX     A   CREATE INDEX idx_book_title ON public.books USING btree (title);
 "   DROP INDEX public.idx_book_title;
       public            postgres    false    225            �           2606    20625    book_authors fk_author_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES public.authors(author_id);
 C   ALTER TABLE ONLY public.book_authors DROP CONSTRAINT fk_author_id;
       public          postgres    false    215    226    3507            �           2606    20620    book_authors fk_book_id    FK CONSTRAINT     {   ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES public.books(book_id);
 A   ALTER TABLE ONLY public.book_authors DROP CONSTRAINT fk_book_id;
       public          postgres    false    3528    226    225            �           2606    20638    book_genres fk_book_id    FK CONSTRAINT     z   ALTER TABLE ONLY public.book_genres
    ADD CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES public.books(book_id);
 @   ALTER TABLE ONLY public.book_genres DROP CONSTRAINT fk_book_id;
       public          postgres    false    225    3528    227            �           2606    20656    library_books fk_bookid    FK CONSTRAINT     �   ALTER TABLE ONLY public.library_books
    ADD CONSTRAINT fk_bookid FOREIGN KEY (book_id) REFERENCES public.books(book_id) ON DELETE RESTRICT;
 A   ALTER TABLE ONLY public.library_books DROP CONSTRAINT fk_bookid;
       public          postgres    false    225    229    3528            �           2606    20668    reviews fk_bookid    FK CONSTRAINT     u   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_bookid FOREIGN KEY (book_id) REFERENCES public.books(book_id);
 ;   ALTER TABLE ONLY public.reviews DROP CONSTRAINT fk_bookid;
       public          postgres    false    3528    231    225            �           2606    20633    book_genres fk_genre_id    FK CONSTRAINT     ~   ALTER TABLE ONLY public.book_genres
    ADD CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES public.genres(genre_id);
 A   ALTER TABLE ONLY public.book_genres DROP CONSTRAINT fk_genre_id;
       public          postgres    false    3512    227    217            �           2606    20692    borrows fk_libbookid    FK CONSTRAINT     �   ALTER TABLE ONLY public.borrows
    ADD CONSTRAINT fk_libbookid FOREIGN KEY (lib_book_id) REFERENCES public.library_books(lib_book_id);
 >   ALTER TABLE ONLY public.borrows DROP CONSTRAINT fk_libbookid;
       public          postgres    false    229    233    3533            �           2606    20710    hold fk_libbookid    FK CONSTRAINT     �   ALTER TABLE ONLY public.hold
    ADD CONSTRAINT fk_libbookid FOREIGN KEY (lib_book_id) REFERENCES public.library_books(lib_book_id);
 ;   ALTER TABLE ONLY public.hold DROP CONSTRAINT fk_libbookid;
       public          postgres    false    235    3533    229            �           2606    20651    library_books fk_libid    FK CONSTRAINT     �   ALTER TABLE ONLY public.library_books
    ADD CONSTRAINT fk_libid FOREIGN KEY (lib_id) REFERENCES public.libraries(lib_id) ON DELETE RESTRICT;
 @   ALTER TABLE ONLY public.library_books DROP CONSTRAINT fk_libid;
       public          postgres    false    221    3520    229            �           2606    20612    books fk_publisherid    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT fk_publisherid FOREIGN KEY (publisher_id) REFERENCES public.publishers(publisher_id);
 >   ALTER TABLE ONLY public.books DROP CONSTRAINT fk_publisherid;
       public          postgres    false    3516    225    219            �           2606    20673    reviews fk_userid    FK CONSTRAINT     u   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_userid FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 ;   ALTER TABLE ONLY public.reviews DROP CONSTRAINT fk_userid;
       public          postgres    false    231    223    3526            �           2606    20687    borrows fk_userid    FK CONSTRAINT     u   ALTER TABLE ONLY public.borrows
    ADD CONSTRAINT fk_userid FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 ;   ALTER TABLE ONLY public.borrows DROP CONSTRAINT fk_userid;
       public          postgres    false    3526    223    233            �           2606    20705    hold fk_userid    FK CONSTRAINT     r   ALTER TABLE ONLY public.hold
    ADD CONSTRAINT fk_userid FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 8   ALTER TABLE ONLY public.hold DROP CONSTRAINT fk_userid;
       public          postgres    false    235    223    3526            p   
  x�U��r����S`7��D꾔/c�ew{l��Le���D�@��m�L���b�()I��������\]��{���]���y��N�����E��z
K����������-z�)콫��H=�
~�o�)���l��F�/M]g�ͭ6��Z?��������F��ޚx�f��z}�O�,��o�n�'�乺2�������Ю7Y^�V5VϽ[o��e�@]G���&�r��M�om��!�Gj]���_���}����~=��d����߲|������ʰ[���G�ݖ���{K^�L��ب��Y�}E�����]K]
	�r�՝uÞ-��*�@"����d����d�/L,�uȊc�mE�Y1R����[.僱z�:}���к����hK�jiJ1U�;��^Q�b��{�5E�sc�'�K9���AN�qm�m��هPf���}˭` �e��Z
RWj�ɛ5�����lĮ��/B�e���W�m�o&`�җ��>L�\�W��l0S��݇~��;���Pq��Z��&��vBx�jc�:j^�۰��+N)�!!���W{��fá$�iD�=����T[�H�r(@�}69�h��o&FK0m*i�pF�~n"$�٨�������(W�RԂ �i)��F�ZP�J���C!��܎�v�֬�scV��q���ht��M�V�2�b�?�m6��g�#�7WQ�Pf����"Qh#w��|�"T�t���}�@K�|����.�'G9~\��VzFA�x�m� 0��Ó0,@u�8s*��r?[�֖6��
�z�1j`��$��-�je��և�d��.�%��4(M� ���_M�y��&T�z�� ��d��G�M�V���x2L�o\%����MP-���rY������U��V\6����ޓ$�6�LN]x	���'�L�3jRJ�)@��d� )��Եͦ}�}����!���h:�%���d�B�k�lc���S����K�Ct`�V����G�ɀ�h�e˧cu�!ޛ�5x�������:(2�
<i��5�fә�
��x�j �=�Έ;����3ˡ0%�d�|Z�G5��@Cf�O���B[��/���l)���F����XC������Y@������f�I��7����h�,�f�����7��r�y�l�ߗ���$�Ћh��	�����x�- ���F���\x�����m��u��ֳ8T�ԑ�n�YYF��e�(�׮6�Ѽ�0��~�j�?Y@ ���L?NO�g�\�l��AT�L�j��Q�D��K��@3�=?�_��G�����%�n��oƣ�9�׹ ����be.}Rp���;�-bA+�%�3�ۖ�h�l��{ԋ5��Ue��T!�-�G�z�F$Pf��5������b�Ŏ�s\��е����䐡z�2;t����6���J��0��`�/�"a�'���
!��Rƍ_�B����x��!G�X� Q�<�a���e��8$L�<����k�)�xoB��d�b��R�7�?�/k'�
kcuE-�E��1�V�{����,O�l�k '��*�OQr�ӏN���Q�k/���,4�ɖ��.�������}�ih�1�{� 	hdd�
>$�j���ó��+�p�*��G�tK�4��D*���3���i?�� Q<���s���Ҝ��ڑ�A����ý!.L�����Q���yP��,�Bq8l5��N�s|���_0a6��Qun��D�y����,Lռ]�"9V�w���X��
� tԜq?���KB�T��R�������
�a�D��)��X
[1�ko�G�ŲctJ�&2v�	c�׊6@0�D�T�-�1K� y��R���vUI�x니��RcL��E�B�ꃫ�Z��ć�� ue���L�q�B8�8L� (��ן 7�܍���#b�q�>���A߶&�㣝���t�L��;�hp�nZR�B�i��J,qMl�m������^r�t�ٍ�X��&�!��������9�a�"v[����l�աt%.�c�i`����߽c,fXme3@+�I�>0*A���TG?�k�`&�G ���>q�Ǩ;�r���V���hI"��_c��y�i0&��d6��J�	�M�M�K��X�8!�+�tv��b��b�a6�.�S���8�K��Oȼ�L�	��~'��4�w	n�\6�X�#=��q]y��el����e/�BJ��hV�x�%b�u)��/{w�Y��\7S��r̓�N�#{"�#�]`��L'C�U��E�cOhQ�V8�2(]�ԡ x��ܶ&��F�rAdrg���:5�b�WN�#oӕ== �S(���ѩ�L�}���(��#���5���������W�y�9e�[FL��A"�^T����ϘB���I�����l�''�H8�9x���	߱';����ʩ�⡢��r�j�Q���^�A���L�>zԴo��k�w���w����)�{�t�tD���2a����Kld�O��Y���sy��W�b�c���9����,�P�;      {   �  x�-�I�� ��a����.����H\�l��4a�i�e�m�Ӧ/[�m���׮ǰai�eQm��bz,��-�Ǳ8��z�w���D�V��ٖ�9-�sYN�m�<�����ǋ�^�^i5�Ȓ'mE�Ӫ��U{m��u��׵����x���N��]����{Z��e���zz��}����gX��g�>�f��B�s�,��&%;6��ks�6���y|���{}��������m��c+}][�{�j�ak�N[lB�ھ)��i��f���%������?�v�aZ?i�����Ӷy2m/?�6[ʾ?�~���w(�v�o�I�e�����N;�wٙ~��<g,=�vz0Z��J���h��2�]��.ČmdƱ3�
�_\�.�V@-!�w�0�]�2
a64���!҆ �7!�Q��6�""4H �Ȍ����܈��A`0���U��I 0�	�k %�^}��a� 1���hu<tH��wWoq-)�N�D���0C�M6"�&��Z=|���z�����`�9j4TL�1	��F��΀W�JD��
�՜K��$�p�ܲ|��c*�m5>Jt_lI�$Š-����^���L5��% �Kw�E{����O���[%XS5b?H��������=_& ��u{��Hb4x��^���V�"!X��D�h��w��;#1:?A�Z���^���)�c`O�䐘⑙��|�(�Q���)���u���8�O��Ys?ۙ2Y�O���$�i�T����K����ll�~l%�ʟ�=d	�9E>��2_�"��$��D��rȗ������ϖ�5�hIS��F	��G�׺)��b�W�--�}�_Z��t�����R��hab)���0,K��)�1��*����r=�H�����o3@��K�2��W�a��j#�?����K��MCWKя����/�я<�+i���B�j�) �_�������=�/����	��XY�+s]�1���y�F�!���v��ӟ����B��W�b�=�a��J����Imb��(��UR����^�����PKD+��G+��^��/�Ubl%�u+�gj�O� Ŝ$�d:i��r:1贡3�;o ��)A�u��U��t�Й�S�
=t�(i1���\�_�� �������p�      |      x�M�[v,+D�O���\���ъ�*�&,P�@@���3�N�Z�#�{�����Y�����g�B����R�����g�Lv�|�_d���y=�|n~�e�S{~��mKiֱT����d迬}e�T���ƿ����迬x�έҝ�3��9�<�ȿT>�.�ϖ�:Jƿ��WjW�W�W�\�]��T���D�|j�}Ɛ����[�3�.�Z$L�Bw^i�u�M�G�\�G���i4�C�=��
�@��Y�A�7��8J{\��J� J���#L�h��	�r5�d�L���,wmQO��?��%�[ڌ��P�3HY9G�mُ������t��ݎG]�,�,Ӿ��*����=qi���4�$�ש��<��a�Dc�7�%�b�f}��?�h`������{���r����ϾJ�j:XC��!!��Pc	nSJ��2�*�dg缤�kJ�_��aR�*�l,���ˤ	R[Z�J]�~n:�y0Mx�.gi��u�:�^Q��%2�J��q��]W���W�R�<%��鵽�2ͅϋR����w�Ii4�����|�L���f��[7WW(��Yo����a�7XM��	�b�:[L�Y�q���,��,��"5?he�Sm�hc�?ݰ}��\ M�,�P��9�Y�_<l�L6Xu�aX�5z��z�����5XZz/�aSez���6p�	zI�w��O��{�6�f�tQ�5O[/ӻ��R�5�K����{�gg���������˖gh�N�V�n��#�V�`-+��cez�R��Qf���?N3!KB�l���-�՜����[������s!9UϽ�M��Ky�Y�������}��h�o�ʳ�^_:r��3]�-�ҽ<o;N/�L�`�m؏�Y�ӫo�,�/a�����ǯZ��޽��b�J��w6�\��i*a���TYPYhuKpA���������ݥ�ڏ��38Ǆ�d9_suy.6��ŵ0���,����Jo���;n�`�m-�ռ� �7���[8ƄtE�.��gن��2��0,��K��C)�G��[�ө*aE.�;	�_�s{��[�:��ry�Hi�����<-��<-l�Z����|��ns|�>?n�{�^���c��i�1ݶ��mA��X�=�fS�LH��N���~ۃn�΍����۾sۏn<�f�mΑlz�ܫ7os������e:���#'�9�$\g���Bi�=d{�m;�����<Km��	9նW����U����+!���A�($�uf��qww���4�s����:�����3�3�����6�T��\B���t	���v>�3	�t;�2���p�Ϣ�Ꜫ����p0�	�ϔ�f:��`��K��<�=A����wX�R��xl�L�:��Gu�s��4��u���F�,�]��4J���5�,��G�=h��Ι�/�y�T�-x�8�pǯ�(�f�4�����]�J�����rmL�\����p�N/�I�Bzr�c�}�j�^twy3I��_�����׾���ڑf�Zp�	93�=�a�]����b�w�g�k�y�/���:t�t�
(�?yX��z��T��n��Q���Ǘ��z�\�3�G��W�,ϫ�qry>�dz��ǹJ</��LЃ��{��&XZ�kϧ	鳟�|NGa
�_���/}��?_ 2u�>x�=v���DM,�X�1��������=�-�X{�ƫ,��j>��l�g�=��l�|���˩�y��^O��qm�^�z~��?M��Z��}n�+�L�囦�@��Vw�VW�D�e[���3�?:��u?O<Ht������e��{^�$w���u#ou�o����Ip� ����m���̪�6�n�o;Z4P7�V�za�؝���6cz��a�OUuL#�S�pL;YT����nUq�J��,���U?�3�C�����:�h����'W�#7���F�{�/Gӽ�-.D]O��Z�S+
GD���ċ$�"1��t��?~tT���5��T�N���w�,�i~H5������'����V�h�bڿ�Η���<��S�
'�[9�%��ԭ����Yԓ�DV��Y����~iTSe7�t���~��o�hƧ�z��p?�	hD^���P5���ǩn�4M�Y;��)/x&�!`� �Q�':�'�!8u-ޠ��"�x
����^ݣ\B��-��n�}ᴟC`���"����	� ��~��j�,*v(��G-�#� ��uOn5}�	N!j�Giie�	h�ہERw�1�e�Q+|{;��0���[g:�G1� �s�I�7���R�2��#�N��c\�R�d0�#9�ۉN&E�1h��P�L�~7�Ũ� ���0uئ�ԋ]�0N)����.�Z���ɥ.�ǯ��`яC#�94rh�6�q�UX���w�y��+���ײ5�ݽ)��ݝ\��>�	©�5Y��L.DŬy��E4	���:Lo�����;L�}B8u,�Y_��ۨ�<GUʞ/"�r��5�	L��nq ��L��d��l��ONʼ��D���z�������ߌ���f-��7�\�i��ŎY���'�|^�W`��EY����d�e�ćx���p�;z�b���`���b��r�*%9���_� � �Z��?�X����*����ᵾX֋%�%�lYx�b�:�V_��W�|��ez�Cl����"���.$���g�e��X�b�H�L��Z෮������W1_�U"��=��ʺ������W��#�}��]S �Ä	tL^���طp�(
̨��H�_�L���b�͏=F?�?U�v6�����%����NWi���,��!�D�n{б�}o�`��i�@���;�7@���ab@��"�,���j�dF-?sc�Ϋ�����hp�I�-N�n��7����!��խ�g>�3�����b�2�+�ԁ��xܞ(\
�{#;�ٴk�/��Iv����)? ��O] N9�Òw6b��G�U�*	6L3j�]�~������օ�ԩ�ť��)�1���42�Wz�я��Ŧ�!�E�g��	��S�TC<�Y�ԃ��M�'޺��S�W�����z&�)���n��1����*�p8��.��`p�@pj>\�í��(c/1������P�(�lڭiq�%� �������2%r�+�1�����s���!t#xu�x��� i���5.?5lb��!y<�����pʻ��o&эo��f˾�3ny�ˍ@��4<$7�5�O�����pk?������u��^̞�U?��0`^�j	jO� ��!���s�3mk�A�#<6�b�_�I�ӳLq{:m=���AQ�^�MZ�20D�-r�^�$�3��a�b^�����s�ߞ=�q*����^^^�~�@����ჾ~�q����EvX@��'n��x��役<~sa���P��� �T��pR�3�f��h�i�Q��>Z��T���_�$i�x:�@�94YZ�bZЪ��<4E�����4o�v����^/F�Mޒ_�c�.-!�讯Ϸx�S�J7M����ۼîW�5��Q�_K��Q,!��XZ��0��$(�#�R�q%��>c7̒淴���қ����3�pQ������uSѿ�B5:� �뷸��:��	Ս�*�2aD�}�3emwDTU�
任Du��(��M�w��`�A3���Xu1��.�B�M�����nCD�3�-��?�0�u�{�G0|��!���;v����?b��Y���YaF�����!�����T���"Z
���}1*",`3�����
�(S�����-�UtX��(�T�X����`�
4C�
�P �h�#���V��W�~���+��V�X`keN`S���zx�HB�.r/��t=ȷ�ay�����.�V{��
-~MZ�U�lD�EŖ�؆��Q{¨��p� �,LNPFQlYI���,�����[؍����%�1*8���$^
i���bӂ�3Aw�.��մ��Q5�E��ۨ�@�ڎ��w��b�ʪw/�p�	tT��	k�Й� ��5�4�@@ 1j�a(C�x{�?c��fI�xâc�9Y�ӿ
� V  �f��Ѕ�:����ɼ�P5���	0��B�Z�� �- ]8KY���i�=.�F�qrY�s3:��NnFm��[�tTbT�[L��d3�Z�`Gj�M�۰�8b��PБ&eL?1�A�<����g�fŔ*�ɯC�p�D��mQ�mQQm�@���6�����Z��<��X�Vy�"
�0� �B�^�PpQu�-?�]����H� q�ɮM��ސ'�)�����^u,\�
��r1�7f��������b�
��]��
&e�>f;X̓��W��ˁ���=L�lf�*'�n��et��K+WU��_������@g����j�AZT�6QQ�a��A��x��79�Y�����fЦE�@#��z�k����!�=ۑ�Y)Aw�U�b��ОDws��};b�eR%��0 �8B�*Q�䫋�	��4�0��.[�8���w��bN�ÂÀ.�ӎ@���#��@^|�鷿����a�5V��^��E��	��_la��`E;�b�����Z��?
t�>�l���e@���<�!���(�0N���t8��ԥ�0�#�~�����E��@l�s�!W�ԭ Qf'x��(:�	�ҧ�%�	^$Dy��9�!h�B3��Upf����a����k������:u�FH�� ��
$��$W�	��� �/����|1���a��P� r/`�w��Y�*��E���2�y\�Wk~������5�@Լ�L�˹�b���>�<��@r5�$��G�T�߇pk"�gq~��u�7^е�&��0Q�x�����O��}��^� �J��	鋊鋊���Yڳ���W��W���W�^��� Q�_@�4_@�T��5,�SX��`>�.���0�E���E����`��hvU{���x��~Y���/�E���Fk�?���ߋ��g����?~z���C�YUJ�ÿ������%�#�lƜ8 ����>(��3����P�U��~� �A��{�ȿQq~�}X�\������i|I�g��~�>3j�9f��l��Zk��4�]x�n���4,C4�FK8��FuWG��6��n�_ϕQ̞p���`����(6P�V.��-R�t�ښFw�o�*Vp�'�<L����h���>�Z�����;G�}F��'ЧN&�����jٿH?�����o�������L������A�̪P�QT����P���*]�v��b�'��������|e����yfI~��H���Y��	'��Oǩ]��/:�����*������?��cék��e�i�/@��}K�\i4�������m[0 �&�n��������G�F��4�S���`�`*���̨>:�����xz��6���T��U��%�!� ����oTX�Q�/QnSU��F�`��!����oh�JX6��+�r������Q�(jO�V�#F_�Rڍ����3�eTgg{��M�^k�6P��P���+Qo[ߚ~?6�~m:��p#h7pベA`��~tʧ���.����R>`8*�0+{�*nƅ�[aH�N];��f *������|�����      z      x���˒ٖ8��E�]�k���3 0i|F&��b�&��zr  ��p��G �Q��=�J�I��Z��M�k|�Y���Kz���9� ���JU� ���c?�^{�����ݪ���|��׵/���C�:y�*����O�Mr�괔��k�e���o�䍫}U'?>�S_%._˷�����Ϲ˫�/�2��5���F���шO~�V�?z������\'�}��=M���iU�	���>��+_�]~�-f���l8ͯ����|�,z-�qu���fɱh�u����+��£Oޕ�er[��m�g�d8�Ln����#�,Yy��\����#�r˕���eqإ����U��c
�d�>�Y�IfP�o�*|_&�yq�/{��p�<�n�N��)�}�Y��[�n�}en��ǦLn0��Ǣ�j��p�����l���;%�"9z�_��ޥ�����eG��kWʌ�+�ڼ�}����MV��]��+�m ӒV���z��W���ޗ�d�9�1R,��wU��L~ #=���d��ʼU�89���8\�e���"79���r_>��Z�2g��үˢ�c"p��MYe�T=I��Wɰ|�<��M!��<�UZ'�R~��,62��y���.dԻt_�ls����w��ӽlh��;��x���H���QVQ�M�K���_�Ņ�'Y7>�w�wɛB6�OE������z>��+�?���6i��ŲT6�nگ����p���crJ�� ���y���2���b3�ڵ7]{Ln]����'�����:�u2������u���K_7�lG���b{te��e��{��[��I�T�/2'r����J��S��'�n�=�T�IU;N��ñ(�u��|�l��ʍ���i��q���Բ����eoQs�hڻ���^�ջB�n"�!��T|L!
���xx5�����;�29����μ�뭗�ٔE�J��P�V;=��s�V�'n�V�-KY���7��[{�S��k��2�+لU��'{�ڹ|�m"�)9��k��E\�x$�~��e���r�{��@Y���_A.�'nY���L�\�=�pٛb�f��(�_d�Q93�+�5���XU����Rm�.�]/7,����p������c�N>+���=d1d�D
b����}V��n=�:�䊣�q��[�K�?���˾�cXbZsN�o����Z�T�r�����"���`�d	�a��r�49��<=�ڗ��	��?�ҍ�!p��B�2��?��#|�Ie��Le?��>��wa<~4M��e��{����(I�8"H��!��A�7�P�lx��/��/������w�3W�Ү�ߋ��\�U?J�l]�Pm�1�pO�9*�T���!M*j8���q�{O��U�ꖥ����`�,������~�D'$ˬ8R�P`sCx�]������Z��q��T䝼��L���'IiSY�  у
3#��vGŏ�.�s���έ�|Z;��9)ZQ\�j^V�7�q�gv���B`�/�g"��f�V�dt/�q���f��m��e+�f���s�TN[#����z8��4����ȉ�q��Wf,���J��E�{�er�Ř���nRXhq�V"ȊlY�2����˄�i�`�e�����&�[� ��t���x"�,�;�k��å}Y�j�`�5%�t�2۞;�`���2��+��8�s[�����⮺ǭ09M}�T7f�+`j�8��)��>`3�q;b��3�W�������q����r@L��!����n�'v��_�(n����9�_�WV;��P�\m�wUX�lB�Ux^&�T/��Z�*D�5yε
��^��r"e&��+=�e�x���֜X]J���W.֢~�Y��4b��i�\������\��C
�(��N&��������Su��D��dCІ��g��d2u�n6�B�x�.�d��{s�`�h���)��wrg�+�p�'Ȗ����j��m�,e�dҩ�徫����Ӽ������i��Ȋ���~�j�S-�qM���~���[l��\���8��R�o�/b5�j��c�d����D���D=}Xέq!\�@�p�O�� !Z� �u��^ԟZ�"gW����ԍ��fy�^^�a��*Y�^�w7?$����B��	��T6<���N�#��?������f��&]��[G��X���`�2�C8V����/� ^���h8����MA�c>-fb��z?n̖�iN��EX<�ՠ#R�羙Ϛ
ֈ)��C}q�Zv^�j2��r����@3��0�`\�QC��|%�|��ƆF Ù^���V�8@t����Q�v�Xn�`U���GP��<3��e�%mT�U���ϲ��h���+��R�M����Oɋ�ȼ��U�Zy����Z}�=�rl^�^�I�
��<�n�G{�pJ�2��ld�`Y����<r���t������N�5l����b{�g�&ޥYQ�A�g�qi892+�~rJ}�փfՌ
�n�E��šɜYW[�IJQ:m猳��j���"�p�/��EI�¶J^����s4'�aZ5�!��Kηأ'h}x�]8'0ME٥��f �"t�q�q�5������0�1~4T����*���q/�<��6���-=�o�Z�*辗bb������&�FD���|2Y��U`�(�{QGjj엍9"�D�Q�[��j��]<��|1�Gȍ���Z2�;F4��O�w�>a���6��3������a��x�������%�
��z�O��L���>-E�C2O�ж;�ox�"`p�sĥ.��c���O����?�|�b?��K^#�S�;�W˕+<v���"�9cA��� ��`E���r��E���-[I�`������w�(���6ǆS�T�X��d��l�Lz�Sq3E[�����P��ޏyr�l[W}1^'�~/�ɸ��F�p���T��b�-��R�uYh\��Y���
B�EVIl�b��-���Ϣ�s9�G��}���i7��| �����Mط�n��"Ȫ?�EY�U��؉�_A�r�4��m9qP���LU��i���7���c>ZZV�H��W��	�.��8�#��"M��3�1�?��{��|�h8�a�ى�� �ѫ��eNrĆsU~o��-e	]�p��,-JDF�/�Cn�S'�����ľx�:N�Y{�q΅���ۆQ�����KQC9�{�J�˟�w���y@��{��nt�r�'x�+1�zÉm9u�Ez˴ؖ�c��V�������ǁh��t<\��js���4}��{�F���u��l<[L&������}Pّ��q}w�C�׷��T��C�,?"�����K������J�l6��~��ߵϓ-�c�����/��_>�.��#�����ԡ�/¡���\��b�3���o���ސ���������[���0��/�:JH�G�kč)v- &[���F�1��ihR����:�R����DXq�JT�ҕKZf8��#*�t�{�II)���+s:Gy!^��#<F�A��r׺3js��E"��#�qs�K��?{v<�uqb�dj	����)�Z����g��hD��62��DN� k�s##��R�8�تX%Y��X��pG9j�0�(����^���_r�4�W�_
�.���ܽt�]Ek����½������&_�����ݨR�*J٪t�i��M�m�Ub�%��_�*��D���W�;,np[3����e��7+��J�/��-t����\�|�/�?D��`���.�e\?��+d�^Gtc.{���c�S��w�jk�C�6{����k%wa<�
4��"7E����Nǣ���bֻ�i�3�fW�v�y���2�Uѭ����y\���;��-���4��ݤ9o�:��#b�p&�7u��)7et�n;�s�,���/�.E4�^��,Ch�"5~��:������Pgy����\�јp��p����ے,���jW2�79�HhjQ�-��o�Jgܬ�� �ő�� � ֡|M�3x�K]nD�(��d.�[	��9鷇�)�4p<�W�Us��J�0l�~\��̖�=���Q�ɣ�wW#�]����L    �W��t��}�FJn+�V#�ܥG��G^g���p� ���ʯۻ�Ht�G{��x�������́i�����Iο��S�!&LF�����p0�uݧ���'���+��+�J��o�-�6���Ny�gSA��X�u͠Sog�A�I0y/VLˆ(92>"���pC5j���
2f�l�ҋLF�Ŕ�ف� �Í� (�|Y�R٬b����f��bB��\q_=���7��-�����}�T�A\l
~�k���$|�b�eɡYf*(/��FlB�z�0v�����6��<]&��Y�����J��[��R:)�o���d������х*��D�t�'C<\�?t.�
d�"}�"g�������gJ�5��ej�Rf���@ "H� ��8��L��b��Y7�z��M�1	�_$�fgd#b �3F9%CoK��a����'�@��?e%0(�i�=0� J�y�,�d�W���l9�A��L�"]�c{8|�Q���E��S��0��)�֫ap�$�.̱,�������t6,E-_�q!a��X�{D�;��Sk��h���o
��9ǈ�D�?�:_~���ܳx��JLc�I�r%�T��ć�%�L�n�K��D�y�!d'���kG_ܢ���]�Z���D%�q[�%�pLh���+Gi�0�<r�/�8�:��!0�ុ�j���>��p�#��
�4XDٖ�AC���$"(`�ӦG�����9�%/e��:���q�>��D���;���������fc���u*�k��|('�8�Ď(@9v>GV\��͓;�1)A(�NF�ލ�e�'/�H�����I�<y#"\=��V�ϗ�s�2ē^�U���1���j �Df˱�)��J�/�����A�LD���̭97�6ej;_8��]r��Amey|̭@~V<��fU��A�G�^D���V�
QR���z�� _�"�Ԛ�g�\[(��V؄�6��c�y�S;c:"��M�hXS������|kk�O��<���r�v�w�Y�"N.69�5dʪv���p0$�}�<����v���$������D4�S������Ո�FL������'ϑf�����Tm4k��zG��9J��tf�a3w=��6fP�}zv���L�k�W���f����RМI*Y5NK3�\V�ԭH$�CuP�9�Z��6��^9vN<���o����"@:��cMˮ>����ahLB�D����
�$���k#�H�.�-#@�Dh�	 ́���YV����4o�6�T��䊹��x�����!`�d_�H#,5�����D�k0�jx� b'��OnDͲFG.�l��noEԕ{�A�PŻ-�P�C�8]'y���=I����� �<y'*�dt#\�{#� ���ጛ��O��Ń�S��^΋C�J��N,$�+�4�(.�WɍxPr���^�[|019��^2�Ar��7N� QT���DD�Ｘ?ժI�K��|!*?��k��v��Q.��Q�no��_�3,E�`�O��X�f���Ѹ<��Ļ>�)M��d�Xh�P�(�B�u�
�)�]une�4� `�yܑh�I�N�qx�2��k�ů$&�W��l1�f
�"y�TVXC�#��K�m���ߕ"�E�kPƐ�C��I�3nx��b̚�r)F�]���4�J֑h4�(���pm�8�@�E�G��L��ٱy��3��rF�#,��Y�\�1�L��\#�c���jB��6�������2��O����	�����,��b�s(�{l���҇0f�[�3���0$"2)�B<��~�'��� ���ZB$�r�k�C_�Q|�.�&���՚���Wa�_�����3/\eb�4���C�j�2;�����-������	ǮٷI�Ѭ���M��fZ���Y&� ��HRl�5#���w��8�R����R�6
�KBWjU����8��gn1'�ALV�N TTWO^�d�����K������V蝬l����,xpaAQ ��^DP�[�r��1K��Ӕў�9�o�눘����a:9�HCB˦
n*`���=褔!���-Ll�q"y-�eM_%&�7�⸠�� n��>���qֆ�5��1�&��׷�z$=��ע8r�B�v"�-��y�&t*N2�ἵg�v�L3�=cۥG��������$�������������+0��G$��z��V
E��ꍈz-��w~/{�jf1�@m�'�f�bV^�u��
fY6]���0�GKg��κY�+RM6� �b�[A��6T�6s�ސ�i>�kգ�79Eȶm^�W]S�����!������ˠ!���s*�>h����,�Sh����`p1�\G���D�x�{ɠ�,��8YLq���x0��{�]��m�yZ�����)X��|,[�n�GY�h���k�T��>sΞ�J�(��n'`P�I�=��҂Qp7���+f>4�n�� <З�]k�F��iZ�J�����v ��]��,���� DX�5�Q�q2+����x��/VAZ)V�  �2B��$�-��KK}X{#9�e�˵A�����Up"�'�;����0q�Ww� �"�:�q,D�7�\�C�$?�ؚ�$�<��Z�ń?#p� ��`�h��{�<���p�N
�R�NQ#�Z�l^� ]yn����^)u!R��z�j�G�r������&b
1��M-+rh�>%��۝��ו��|�gE�엍�	�}G��P�Wږ��P�	d؃~�D�W"�ðg`�k%�[�i	�!��Թk�j��O�C��P܊��iRLG�'�:���b�^��Db^���H�7 hF������H��LӤdf��/Ӫm�Գb�-k�u�=M��KQ*GTQ�T !|����*�檼��(��J��Lf9f�e��ā8��t���A]����0dl�,�2�֤�hÒCba�C�Nm �}�=q����m� 0��`�����y����ٳ�1M�؆��Wel���� >��j��1De��h�w�T�$�+,��-�-�v�Uu�PŮ���i��7�5�F�Ef��z��R(z��ϋ��c"�)~�`l��Vt�
��eH\�d�6��D[�r�o�����b5��q�
���8;Y�>=�Fe1�W��7��W���v��+B�'�z4϶p2���a�IF��a�4�����Xj�_������ y&�������� m��"��9A�>��o����Y�z�P���f�6������Ab���j�d�t���U��?�/��b���D�d��JL̙b��S���@���3]���� �U�T���_Y��j��m������yۧUH�O&󡘂߹O��E���I\W��eo<T��x!&��EO�k�����υ����>�z?fk�	}t��!��/-M�<�A�
��gS�a��^2ǵ�
���d{M�P���l��lދ���j�2���g�q���l1�LzoN:-ec���@m��nİc�O��d�l�d!x%�+ �e��^���_�,Z.(�X�R�sN	mvq����Y���{�k<�G@~%z�*���Q�1�;)S�I���^$b�b�g"�]�գɨ�O(��ҧX���o�1A��m�\��	�]9��A��yT���t+[�9��|6���������v�(��^k�Qϐ&{����V�Tq��}iE��Y� ��ltY$�$>��*���^�y�ʡ�a������,-�+���&#\>��'�C%�W�Tn\$�*]�n ���Wy ��H�>I�עIj}y���ߢ��K���4y�z���9owG���͒m*�S_�o�+F&L%������� ��J09�"�Ş�� �����!l�2�eg�q+���\;<�F�M^]�.ӫe�b_� /XV)�!و�Ǆ6^��s�o��o��/*��)A���X�Q��,u�L�5�5��u2�0f��n0j� z��J]qv(0]��é8^�^���8���9hW�,��O��/�%�    ��k�n�����Q��Ak��i'#���]#�^�/�TfN����P�R�+,e.�HO5 <�^��w[���E~
�����6��eV�Et�)'��������7��� Ʊ�V��L�)6[Cn%� mC�!�3����Rdl��yYŁf�̒9V���/9M.h�:<9aG~�'~pMWK+��Agɉ�?� .��P�]��ʖݦ���*�=$�KFB���˕�&��D����r�{
�Oj �鴇j������O=�xO�0��".Ns֢5��Z�7����.�_>L	Nz�C#��r_����C����� �0���̛4̰x9"��a��B��@���|>�b��E�4�;�JZOb����Iw8��-�f>�ӻ�E"��� ��87�摙kr��!�.'���y��3���)c��Ba�V�l}^��5 E�����1-�׊��Y.��� (���3��Z��^��>i褋�Xc��B�+��1d�	��0M�'�Ă�4��ۮ!��R�k���F�r�$�;�{��󕖣�)��]k񔝻&�8Ӕ��J�#�(L°G�� 2Qư�[ľ>]�ϯŜX� �qF�P�|	bQd��]���Bof���Q,��oE�b.��6.͓T���X����f�+C,�\�Y����Y���z�����m�4���:Ӝ�I㭰0�7Z�l����l+d��d��S-�(��g>@5R�,\�JAX �d=]Z���Hىs��ЯD=�BC�H��e�j(�m�6�2�S�8V��f�b*��d"�<d�ì� /�{-�Z�FG��(y�|h�����&�Z��ⵐ:Ӣ������%�$�X��;V�iL/B�*�`!Y��V!㡸�K�^yǾPQ��B�X���D�`��\�x>B��Z�|ǉ��*�+2�ϊ{�a��m݁�Ѡ��o�;�@U�t��^���z�ȉ�,l
#j�/X]��`M���ٛ�dQ 'a�!�����/d��7��#�0b5�[c �s��)�AF�۾1���jX�O+qe�"[�Ydg_dnE&��ܹ4�
w��3��'R��"t$9����p$5��C��ZL��v��t��5�7+��6יʛ��9d"ujΎ�c���g���CC%�Ѣlm�Tߊ'�m��@<�M��E]h��s:��E}�n>A�7�ig2��O��B�a��k	Q@�0��;E�u�9��Z�8�W�ky�;�@�&x�%̏���]�f��J��ND��[[�?A�=��cn�H���F}��t1,�Ѩ���%��@�a΀�|(��O�e�%�:["BpN�;'��.=��FZZ�� .Uٵ�K��X\����CJ�q ���z�4f�V!��l� R�����.�-�xy;@a��O�}@d�\���**"�!kE��$�tU�>��U�ѓؓ4rs(�������2�$%��BcL�y���߽����:W+�}�WN��1�գ��~�ש��U�9o���H܃S&߭\�-�ǜ� 7��Qe@��Ϣ+��qH���<�p��[�`u�zڹ��J��P^o��ܭ�pE&p�@�_�0#v����@8	'�ۏ�?~��u'{Fv�wZn�'Pd����V��Jm Xr���jPE�w��� �}-�0}�r��:թdƉ ����2��P�\�Ɉ>B\]��'�$v��Bv�����6ug2��R%{pJI!/������:��}�{s+z`.���aþ��>��ZA=��"��?���@ճlX�XУ��ݫ'��>��cB8T��a��`�C��j,`����#ș���(�ap���5�y(���s߭J�z����ӓ�I���G2%~`0pY����Вv�z>;Z�)dc��f�) ���~��+ͥp_�&�Ne�����GQ
����L.)h�$�?��x��q�-����VP'|k1�m�i����mIc��*�?�J�[Cw�O�R�F���\�?T/t���wMI��4r
x~��h�L/���^��k���o�1l0�]-������j�#����<C׀9D�; 
�#-�8v _dI�g�9/�M�L�x��tC�l؎U�%���Y��>E���o�`�f�����*�*] at{J&����XޗPD(	d,O����C�hg�s�fyf9�>������f���$���x�����ЩX��j*��H�V2�I?�N�v�Y6��+F:����٫�v6���������&: 1��k��;�����@�p��J�@�8�O� �l�ޭE�����B��r}�2�[��CC��B�d%Id4*��b���W�F�r/�:V��ٰ���&ޕ�g�H1/w�nc��~�xq핧����|8�'_�-O��,�=�Y>:R��}0M�D}���uS�hڱ�C������ⱥ)��Dҥ|�MDQ:�0�kD��Kn|��P�1h-��@�(�\�=���^��ח�)ZX-4��q���)����� �ϳa����Dޠ\!���̀�!��@��!�Vl�a�Q�+i�J���P���i�гm=Z�_�~J�ǐ�[cn��"-C�(g�r�nX��\���U�v�+877��{1��Չ�,�`����p��<��X�2� {z��*�w�ӣ��ޣ�Ŏke�����jq�8\h��/{3����x�{�j?��������p�L���̥P�/�G�A��x�77>�����w�QQC��ө�-��� � ��a�Fu����Ӓ%$߂��6}�/�*�6���=��pG�=�ɥ{%���{5��ȋ�pՕ�;���y�W��#;� ��a�e.݇�x�ԨV��(����}#e�1�T4�KIL��d�S���3C�����,_�T��zP5,:��G�zY�;�+#���(5��A®�64�}��ɼ*=)�a�*���X��5���;_)����E�H�
�d6���P�I�:�$`[?�IQ�!�`�t�`UT��Vil����u���ZiԹ�*���ꈰ.8�����*W��[P��������Ӌ��pe�煠"X=13{�d9ݜ�X�I������^�EoQs��
3U�*5�,��v��m�����1�Zz����G��+�S��#���/�n���T)�Cw",�4�T+*P��H�g˔~E:|ۛLW3�����(ΛP#B�]��[W� YF��x2����� #�����]�v��w�'z�F��g@�X��G���`iӌH򀣃{K�?��o�j]�e*�JΩ�{I?B��_�d��?�NBZ��`��g�5Y	����EU�_�;h(j`>�Gwp� NS���1�9�l���8��ـ�������7_�<�#�1A[u�� ��t�4�ӷ�PykX�]��pӼ#*�^.������8�������5L��"�S�	������Q�{�>�
	cJ��6N�WM�!��2��A5�!q��D�o�ZW��Y�I���ؤ/F��_������Y;V4we�n>Vth�p8�Q�R)(��`�;�>t �q��JZ+6�����Ҫ|����]K��aTV���]�{����ԉ��?B�Pȑ�HQ�b@,T%���X|z̿����9�K8D��&��,�H�s����.�����H���'�]^���=����$��!!� k���\t�v:A@�Wo�?Dw�Z������_c����a�+����>������CJ"0��N&��Q"�Q[��}$���B���J	.Z[=ADq�z�7�^_ѵ`�ѯK	���Ͱ3Mq;�U���"���l�L��w�`�W��[��S�����B���3�[�rce�H}�ͯ�jh�Ȱ �UiVX����FC���o�ӪA`]3-�#n�1\wE��ƙT�➊�lrfdQ8�x ��Ȥ�S�Qu��uT,fe"�p�R�q_���A>4��u�mĨtJ3���R:�3z4���e�z�-���`�V���{�<���Ѥ*�Cь�a:���ai�ss�;;"���I�nU�X�!�
����t�eg��l�h:�Pn`    �`��m)|6���F�=y�icJ�r���] ������~��77��Z�^E�Q���� `�4�;��X�]`� �6�8�{�z�}�
��+P��R��#��n��+�����bl���m�8�lnCU�����O�A�:��M�@�����CK4��%�>�`���'z�W�ؿ�I��/��1����82O=�����}����aF���OHAk>k�:��_d;Eګ��k�L�t�ߝ�l�F�ǢK�����v@$��;'|\�$�����0�Ϊ�|���m�k���˂���BDjI-�� ��R�3�ۆ��r8�ݼ�����~b�vu�s��e�4,��Z�c�=/�^�d�I���ơgii��n�9�����aA�8c�U*�����$M�v�Q����C�E�ߟr�t��y����	R�%F�T.�tJ*&��N�U'QLѩ�q&�d��XsE~_�x���~�'�eH}�8L�%,�e� �����4��<�+-�.�3]����(؛�d���<�ʈ��񢹘�F�G�����#��9?<��oǅ�����*�0�$ڝ�ݕ�����4�D�#�Ӯ�-/��֧>�����&&o�qX*��� ��s�nDl!U@D!��В@L�u�m�� N�q��y�`�Kԙ�Ϟ}�b�WY� �؝5h���k���Ffy��j�%J��!�c��j9��}�����i�O�#�8��W�W�<�<�np�V2ޓ)��la@,�a�c�&V� �#��϶�5u�N5d�@�H)[ږ�E�6�E��j6���9e��Mvg��V'�P����b4xt5�]�5���q�?����%D��)��i��H_��h��$�g��?�?���|:�'�Mn+�u�c�L���MjE\Mz�j#�F'���L|��^��|�{�"XWj�e-mTR3���	���e�+_%[�Q�P��ϝ�&�f���2C�%b�4
�~��ۃ�,ZH��6Ry����U�;��S�v��>jhAS�
XGҷ:zz7Xx]@�̽�kkK�$�k骔���9�A��6VF/w3�ji�3���a��:!��e�Nk`��V�E�qBk�B%�!Tʃk������ب��M�}\M{����%��Z���Y��^��2B��2!���E�`y���,�v���Qk+(�M�U�1���,Ћ���-@��_�ôq�p��t�:�����4�JU�8	d��j�4t��bFʅ����EZ�a@�0���1Ȝ�U��?v�P�Xܒ��́�u�m��h�"�S���R�î0�~�YV�4���B;�ն�]z`b��^I��F���
�g���>b�8���L_�Dy�2T��>����E`.��+8�A���]؜=N"g�tF��y��,_T�E��(/����F�kP���iV���ie�A�u�W&C[�W�d�Z۪�(S�����/;�vP3�S��&��P�닥A��7���"r2�8c��s�8��:c�ЉM�֯�R�2�9<��.{ӡ�gM|}M��ϳF�5�G�Šw[kC����M�8�&_����
���Riោ��c-;���ϛ{=��FP>�g>���L��ɝ�'��?#'�Z��U����](<*����n����
�ɭP�ï��a�k�M�>#3����'7y�
�j.FcF[cÛ�H$�Iw,~Ry�z��&z|kM�i���K��o��Y1��٠���X�Q���u��n��CQ�dz5�s}� � ��b09_�㈜��W���M�*�;a���ɗ ���Z�
o����{�0֡0�4c��bf�H�/�nSmx������&���A�~9X�U�h�h�~�j��cl��?M��"6ŭpQl#��On�`�#LC��`Me����_z�������ұ{�b�v�jJ��R�g��L�s���6�}Q6�St̬�t���>^BZ����I����c6���rM^_�ߠ�l|��s�4�OL�w�~tZ����~���!���:d95��oI��&j�6|�6�J�_K�;YȭKūP�֖��������dw�����~Og��l�'���3Z����,p�C9�Q��8D;]\��5`c��Fb�AFR�A@���m��]#=�I���T�1�?X�|��*-��ބ�?���U Fm�ides���f
u����S<-�2Z��꒣d�+}H�M�'����<PO��{��}�w�=�W"h-����"{�!09��Èr�_����٘3�w�+�.t0����H�yPd.���t	D�VLm��bp	�D1=5F ����Xy�ٖ�1.��A�$d%��(�K�CD͌�U��8��d92���R��?郚|H"�d��@�{��N���x�Pc�M1m�C�&>�Fzzk	)����U)U��@'�S�g�ǉtUb6Z� o"�RP��B�v!�������a�d�Y�kvp)�tyLW2N"�G;��]�+�́�_�C`���ᬅ@7y��gQ���2c^��a��ym�|��m*pY��x������B�]5u��D�n����.nحDոٜ�ᜆ��H�YU}�|�+����>��I�(c��'��?h�cjHÞ�d\lmU�8���{f���l'�)&�w�2��LdF�0�"�0��9F�L?[��(Q·���Dc���̲�Ш���r)����5sk�*�Y���S�Ѯ��XT	hT$c�����mUώ��y�Ex;cY�E^,�q
4�>+g�^�i�C�ՇN�M���>-���c�,�Z��Ŋ���ي���O�ϡ��];ʼ�#�U��mڃ�t�T�Xs�4���-�n�a��1�Yc�b0
A�b;���H3Բj���BM�L+��+u<f�%��
I�����?���JlLiV�V�.�AU[Q5ꪃ[㺲ݨ�0�p`Xc�����l8�(o�:��>גW�Eʽ"��%Ȭ�2��*��jy��Yٓ�{��b��w�$�A�1�0[�$ ��G�A��<�:��AjΟ&�1��JNQ �E0����!�@�!䞆>c�Lv6 =�·�2\=��,N�Kb@�2j�R-���9ne)��=������tnhe���ݣE��� >^�\&B���xkc�z:��ymE}4>�Ti[�����q����"�D�HJEO��%��I�@����|y<P���mG�J��@�@��ɫ_!�����R,u�7�o	F_�vZ���H�Y@0��Y]g�1b��6o�tTD���ɠ@�L�r��d;{V2��l?�f!{��X!$�ZW��M�\b����Sv@u:���_����`��u$�d�"�չ�tսOb� z�L��<.�N�����jȧ0� �~�u���h�-��j�P.�Za^�M�e�:��+,�XPiٜ5쎍�.��|�7��]�}�.Ry��]�6p�*�,�/�����W�T4��M�Fq�T�R�ݿ՚�:Ux���]����e��������t:�F�kL�1y̋'�햑K�	ر��c��T��*�[o!�?�-��赝����ɠG��qZkT\i����;������,qj^��)���A~����7m��V�B�\k��D:��?��.$�g�F�d=M�P�qc�2S�1�k̲�m�*X稲�S]*u��iʸ��bKz����S��X �m`���>�	9�����_���-�^[U!r_:�+��fL�ʕkŐ� JX=e@��죛��$&6�+����D���"��N�x>6�l���/�/T����m���ͪŰ�����tn�V���5�sҥf�y��q�g{;(�,R7�d$gb���<��� �:��p0,䨈�L����+bC7-F��U��=�)ػ;�N���m��8ō[,F%y�ۺ+�q4�v[��ر�΁v[��Y�Ɗ��f�7� Wg�f��Eq<c��^ԨTZ�uzw ��6���z S��Ub�:��:����c�`���Gq'�|��$���;FR�K��sE>���ց�GS�*�i�w��k�+�N�ղ�?���箊f�{R$P�Rv��N�:g� l�Y�٢�	    ��Ƭ�R���N��J����<9s����U�T\jm��N��2�槊���K�=BI<!ɘ�YÒ�mu*�KC�c���ޟ�U�:m"�Bk�!B�;���
�`)��)�(�b�X���| �Ƶx��Y�f���h2[�{~\�(F
�|@��:��CJ�o�J_k��҅1Ի��VU�CA7E?���>�omy:���7&���twD"*Pɨk�nڧ
 �� ����kh��zd-�p�����j�m�!xD� e�Z_���>���D9l��6�����6�}̈�kE=���6��q�����t:�$�j�4�8��瑽���}��%RUk���G�;�)�I���
t"6t�QN[�8����@��Bd%~��T�.��rLU�dAYX��k��Y�[��9���ke��3���������KJe�-D2���$MK9�#�,͇��Z��p��H7`t8[�ƽ7 �V�����B�Y��I�d1zu}n��_)�����h�pIjX�9��8�A��Ǒ�����?���A�G���9:�?�+Z	x�PH�sh�1�Φ�M��\1V�FqDЯoA�(5�hU� �˭CM�Bټ�$XD��Ɔ�V)�QYY��`:P��������ִL/�P���g@/�>(��yIH�Ҍ��R�y���Wb����з��묨�i��
�Cިj� �l`����(4i���`�D*i�UX��ǽW8�Y`�NG���B�����\k�0��_:|��	L�KW*��HDG�]�ѓ���ħ�Ub��V�Xނ�1Bs����R�k�5GJ5��>���hh�0h��7���.�B�+aLf&о�cVWjRp�����O�ղ���m�Oz/��g��=���<��E̱��b4��G�x9d��t'�%yV���'9w{��>�:Ձ6���[������i![��[�Nk����� � ~�ܵ��SӢc:�0����Pz��W��B���Y���<��g��\�4�ն��u7[�me��Ҿ~t�>����j�,;U�l�u��,}�U�!'YD�1�WK�2��:5_�Û#���L$:	U��%�$�g�Ic#�m�/gG
��ɳ��0dd!�5�{L!�(��ur	�`Ցm��Y���樢z�j/��k��i���`4��3��ԪӢ'��hs%���!P0иU�1�U����P!�ͯzw��� ���]��f�Ѭ�ۯ�K ,��Wq"�|�4}�Q
�5k��H��U��)	%r�/��5E�����- ��[�џ=�+h�W��5�_W�{�]ME��E�=~�� �M�*q�0Q �����I0�G����w���;]�V��kP�ie.R��ã,6"�ܐ}��&k��I��Q,�o]Tb�I^�y����Gd�Q�~�<�)�n��n�����)MC����"bѡ5����^b��&��'���|����z��iO�X��gC��6�6,P��uS�������ִ��n�k�=Sv,Y�B6�Q�C�У�Ό��ΟQ�ps��۴"G��)V�vm����qp0K���b���c���[eӰ?B}"���/�¢N�XOpH5��ۯ�Z�?�4���pUj���ג�<���n�J����i����DZ9E�ԍZ7�X�/vܺ-go��Wi{�p*�"	��Eh���l �J�5�����47)Ʃ�Y��-Z���ϩtu�Ӛ�:g�;�*��:�١�Y���ƟYO=�ً4������ ��#�����<~s%v�365�����}�)�����x8��.{��rA,=e��s��Ǳ|��U�0Z/���m�C�����#v�����mlC�.ok��D]��ZQf��� �fm�a�����Xl�y�� p3f��d��^��O�7 ��y��{�&a�PQ5tq�Dc#V��"@V��4&��/�8h����r��$���2��x�䤱%�6v�/c�� �_��l�U�*��f����;��Mxd���E��쳽G�2^'6�X�� V�X�r�I��W;e�Lؑ\Z���UԖD�uXw�BǤ�ǅR;cF�~���bԻ)�]��D�4y�$�ɪO�� ��!M�S�;{b��U�������� uZs�4�4KjH��b��5.Ӆۡ��t=���S.hV'����U<Z*��!-+g�7e�qh,\���0p�|ߴ�I�j����|>O�\�%�4]\8ֲZU]h>�L�!��R�����O��1��B#E�A�}0��Ǹ�cf6C���8	@i�'S�'�j���P�k�G�K������zhΪ�P8��E�}1�L�b,��;��r,?���4�L�ڪ���t�0��ɿ�4�T���E�r����WB3|�12���Sv��`%\�-lBx�������>Z �^�#�*�J�����I��nAfk5��!%�W�N����o�y��ƌ"�.�x�X��FC�f�	}���j��B�Y���b/ ^���Tpz5t�i(�we�Eͤ�h�3����h��f��hb�Ee��|��^,�Tts��X���KW�Q��g?b�y�h4O���Y�f�gݾ����&�\X�$���1��j��$3C������Ɉjp*EKª�Jpf��ZT���� ����W���0����2v��ɗ��
>e`'�(ekg&wk�s�O�U�-���h�?lv�m�z�X�Ʉ��b��dZ?}�LGk�:�`����0��l���W�ࠒa��x�0s���Co:������b�;��=�(g����-�����]]0�ܲ��j�^3�P��nu߱�^�����J�Y)�����p�:kn�ԪL��T�����V"0�[4%�_LaKP�����,�
6�,�>��Ｘcj�aI1��-�����uZ��s4) eh�xt�b�_�S2/D>Md�߁�x���X��3cTz�HDJCo�HU�;2m�:]D�;��E�o#ՀI�o��/D�ɉ�j��U]NL4���БI��ߴ� ʇ6����2�1	���u;����W��+_�%�ŗ���Z�Y���֯C��Z�R��]g���#�$J/�����?6ؐ)�9���h�1�����2��@�}��@��ߗ���P
�FkB�#�^5V�m��'�Hw.�i��S�H6�עC#�D��V�H!×����!��־'8Xb&~r+cɐ�e�i@�b�fj �n51��
rb� ������Hc���	�2��� G�m$�E@JR��-���ZV��������8���r%�Q������4���,q8H�y�)����+ţ-Y͛TF��]�G-��`Y~��Ӟ%���Q����Ҏ��T��+��Z�ͱ,	�y��o�8���0s!r��������+"�F�����-�:�R+�Z&X�PL�ˠkAEdY)���b��})�E/ģ��Ӯ �M[�7��܈��;��X���4Z"|Ѷ�[v��	��;k{2& �/�,�,h[S�Oq b�2�Hn���Y5^��c��R�$�W��t(>ݗ��ǎR�|8@շ8�{�@���y����|�=3��-����I����^���J@CK�i��y{�˜�qYkgw�;�P'ћ��%�<u!��V��;�yKea�#k-3�9�� ni��} �s���4I;�!k>�#��׼- ����0t���᥻2�� �:^�r�N�d��t$��S>�Y�� \������*x���C��8��/r���y�^���݂�����>�cH�i#�Hv�g��^����%l�:�āZZ��<y,�k53i��Hq������LJ�t�k�5�A�Kc��\�~�؆0_*�~B�W,��!����;��O{�o�3�à�gG�d#����d��v�u�:�f��s���e7�gx�N�ys3us\gj�9h��f)?v�m�U9�0��*�^��GN��Js��V(d�+6�"5�A)nTh�:rI).�CE���.m=�@��p��{�!3a��@9��%�"/R�	�֌?x۰@}��/�f�h��{Y�2~ۨ��t<��j�)�3��Y�����(8 �t���e�dY�_O,    u�k�kB�b���HD�u�F0b
b�W�U��%\ˣ�I�cj��O$$����%D�w��5%��]��BP��;�r_����jHie*
C��͐����V���{�����~�ݮ��G�3C<';8Kޤ����9�<kw�76=�"*���1���6��6m��vg����~G�]1_�,�4�	i��"U���4��;�b�%���k����R���H����u2Az���B�2�,,D;��ނ9��M��3��&֠��Y�N>4c�=��ԲB���SLFХ�,��^>���?��J򠸟L7���Y�����iV�*�Nε�E��Лyֻ>��hգ*�� �K��M���1WT���e�E�n_w^�q�b���-�u���G����G%&3� Ȣ����hi��Q��'�P�����PTfj��_�ÊD�g��g���e��S�X�PpA�<_�r(��<wba3�q������dX�Ì�2�b�#���	"^s��=��g���qh�W����c�.�C`�ap���~I�Qi�ȗ�Ϸ��Cկb4�e/�O�o9���R%wP^v�S����Pހ1��
Д��i)P�U�bw�\�����ej���鼯[�!��5i|4�%}��%_E�TEVs�[ʯ�J������c��4��7A����!���t�-=�Ԧ�@+y�'Z~S��ha�e����51 m��T��f��mH��t��T}��Eì73���p$�zN������h��;�)\������`���w��k�[�v���h�ܟ�b���Z�,v0$<�ɳfuz�^��y�C�S�k*>�8rs��1V���P��G����Z�W�A�wG� �b�FM�禞�}��7�n��p]��l���4�o����X�b�ή��A��q�� ɐo�=+X4k��֪/v�9�5���)	|��v���a�Z)
����o��\Ri�b�Vx$ k�ӏV�E?ʲ��ԾZu�8b�J?yЌ=���`b�#s�\�FY��^�Ƥ)��n �`�{��T�Z+��ďK�WС�r���/*�VE@~v�l��Ð����ظ޸�דS�hE�T�Ŧw�T�k),��C6�2-�����¥�Y�����a���ԍ��++	�VRݰ��F�S�[S�zk�Ȑc�(_�Rd)�;&�u���K�			���s�6�ֳ?O�x��ri�:en ��oRFK���e��F���`�����M����������(�/�F�瑴&����B���&��3W�"Ƕ+���J�n
�򋺸�6Ek�wC`k8��]
6�h��&ي�C��\v���(,]�?$H���!����;����/Hf�;�/���S� 	���g�k`�1d�%CiD�E�Eר��^��T�T�Od���U(j#OCx�X:i���� �� 
�|�R��]�a+TH!��S�%�_�����ڗ�4QJJ`x���tp׆�����1��e'+�:슺����6r�mͦ�SX~ ���;�J���H1*�K���Б�O��P"�3�ʁ�.�g��g#�����v��<�qت4߀��8C���6j�HX:���a��N���q��`f�Ϛk�d.�KX��������{�|� ��P��~B\�OD�ް��-��p>��5;�޽�X��ힱ[*�dѼI^�ff[�k�¤O	^��d2�k��j�L��Cs1orsI'��`B �.��Uak+���D<���f�A�u�/��l﬑�������?◾v �wz]�Ȗ����fV�����"����ΐn2�;w@qB�J֪��W�n	���۷G�KA�2��Z�I��G����A��;��$ �9��X[(ӈ/�ź��86�q4�Xe顊��ë�H\��7/޼�����'q�'��DG2����ϸ�Fad�X:m�􌭳���®�}a�F�B�h�7�^:��q�y���޵ ҷj�h��`6��_L��3Z�t����Z��w�ڲ��^X�UO�4��ne�i�o��4Xh=V�-oYo\e�ϖ�� ���
͡,y��y�^蛈ݱm��b��::�-���!�W; b���7>�a_����$�-4�����V������WPVW�����e�j�fW�e�/R��iM���jb����(��95x�b�H�.��&M�m
�/!��2����MY|a�j�C��QE}���"�����4��YZ�F���%FM���p���ە'o�/�����wM-����ڨ��w�d����ݵ�rb4���]�s#�|�"����eb��o�p"k����*�L����X��Z�xj}u���=y� ��^�H�m�9ͪ5�-��Q׳�;���Հ��礍.��w��]�E{��Y��q�C���P�Z`��`br�%�.sr�.?od���ZT���V߾oaam�`G��-w�G�my�3Hqg�t�XB��y��X#�9��s�y��\����A>�s��%��k#�0>��ؗwM�|��$G��U��z����#-C45�A,�t�,2�)��.W17�̈�镵ѲnԊk\<��FgSР$���6J�x:�:+����)J���p���Y�5%�2EC����%�h'RE'$dDCZE�+�N��Z��C�����Hǲ@( ~�f�
�p���4F��h�S6e�y�oP��x>��3�Լ��UQ#�Q�"�L��UC% <���{�3�^�J�����*�/��ɜ#r<X����Z��"�ŁU��'wF܁z�
�]��*{&�:� ��t��9�OQ�2�BYJ�8��Y��_=� �:���6�2�Qm�<-z��"�t8����L~E��L䷌�����v��̡���}�W�4��D&/�"��j5/��Qg� ې�^w�!4�a3�5��d��U"z�0�2<DY�􋋰��AD�.�D��1����(�J�`B��<���Q�(�L��mp׈ڭ5h܎Jg���[h��p�3by�O�y�:�M'�އ�/������/?��>�p���]r���ÝX�/���;f8F5@j=^2�*���C02��l*&d 5[s��遻�w~�O�w;qOYb�L��ԟ7�a�1��4�}�2֛QT�j�vfg�Ib���]v/J�,e%ͫ��&m{�����p��N�
�~`��ҥu1�0�
Fc|+cQ�V:�
�r�L}`�f�Ks�,��#TJ�Ц�B#�����=@��El�y,!��cQd�.�+Ņ*{�Gf�0f�:�@�UA��$ �`�Y�'6&a����P�,;��!q@�����cR�&�f@�5�e�����	���t-��p_��UV.�$�՘���)�)� x�;�.r��T���$Mf㋈ѠK�ı��Y����������Pa�R�ժ"%N4�i�6v�]l��@��md�s���c)G��XRАw�{�^9Z� �)ڊ��h�fGBΆF�4��q7dh��o��kX�n��*���.{C4ݼ�<B_��<wѨ2����17LG"�d���*�(�`$��S����-���5H���u?A �BX�z�4��Аy@`�y����!Vǒv �������ޕ�לْ=��:��\��2�99�$�Cc���Fdbƛj���Ops`�.L����@j��A���~{�NmPY�/-�fK�% �/�[�6��O����0�b2ڵ-���#�Q�?��'{hK��ɋP%;�Լ��n����U��ߊk�'�/���L�Q��\�N+��P�U��i@ц�>sf���^&H(�g���ȧ���P�:�jq>��䔗A����6<�����̤���WP5� j�$�<���*��	ar �TPRr&��a�0�.D��߭L�U0�#N�xi[��EXd*P���r&���<��0����̡FB%��P1B��Sfs�Sa�]�>��	���lL���Ys��
~[S1^UX��z�����#-�ZWqȕ��P�|r�G=B�*7���w�Y �ZR3M�Q�?U0teș�Y�ڝ%I�B���sU�.ź5���7[hl����]�_4Dg���<�)Mn�<R�_��Xv    Wc�ך�����kP|��ǒ��&�Z�qV���'�u��F��A�Q�@���J@��}�4�Jb�'���.�`VS �W_�¿�A�I��V�흞t�|�����M��[�_Me��m:*��jJ�D2�h�R[�N�*&$H%(�pY辭�6�b�-�_�j]`b;��r�u�l��2h}Ib����!���[�9�?��ۧ����!h��<@)g8]89�
J����]��^��}��s[W��dW�����`8g������n'2������q�F�-����J�ã_G8�:��F����!�i���иQ �0f$�5(�OXfy��eV��)b��(a� :`B5�c�(�����n�2�0����'�D;���Fж��l�|Y��� l.�0�����"���>e c1����T�ѱ�J��f�ߓy%=TZ�K̹��hWz%�H���H��DJ
E�ʊ�|v��svB������J��k�q�J��ZK��E�)zJ���C��֎ٌPk�fb���1��)���rSh�ٺTJ먁���.�GS�;lAlu��ZBf����{9�����k�qWC��T�>�h�M��C�He��]�B�(1����U��HRy� C�����~b�YL���:h�E�)ȟ1D�B!�&/؞��u��!��DƎ��N�o�ô��R p��~,�ٱE�ݻ53�zX�kκ�Pec@32_�s��0Wa�B�bw�Q��KZ�r�m�~�DoF���K��\���d&;T �=������"k��]�`�4i!����1lSy2� � ���X3b\grZB�ft5�-[�Z��x����Y#Z�z�����Y��t���ڈ����-�����+���NMQ�w���>�jۂ�6�f&����G�j�#Syk�)��lP�~$���.�GU6��C�-�Q庫BO^:��N��|e̝��=]��r�!�aΖ���tfk{����M&��Tߠ�N �\�ޘ42�I7(t��L�~��ϋ[[�Q�;������e͒	ːB�-�mb+�$��qh���Q�=�~��Z!=�֡
�JB�7B(u���+
.c��R4{I��;�G���I)�R�!"��-�v�د
���v�t��sj⍺���BVK�筑j�2�H�}0��o�����a� 6E:A�4䈖+�?��7��SK�O� c\��,�{���l���Y�+1*wN6͕E��F�N�ϬAC�!�(�z+�-�w�;a�kM�������c�A1���)�}�m.n�$n~����t8z�,�/ysh���6 ��f�E"$��6@�x�>��p�!����m<��b�h):�e�ڶ[�	�hK`�
k9�����Π��>:;v\ k 2�\q~�m|�$���AA�^��@p���CW��P�T�O�3�:x��
Z5�����!��3Dd�Y4��Ԃ�k��y�%8�|��O����4��dֻsYĎvp6܎u���p
�A�K
eF�}Zb� �'�7%�A��D�60����;�ۉٞ]WSDĭ�B[Y*�G<�Ƃ+�Ӥ�avX�K�O�>a�3|g�%G�h�i�.-�𑼳!��h,�Y�Y�m��3y���*Q@��
�3�b�#�����\��VM���3��#��ʺ<��!�n�=g���0��`\( ���hq��[��E�]k-�V���ElvAN���l͓r�3!�(s��j<��@��A����0��D��1[��x��������k6[�ʝ��]����\�/'
��`o���}+�R�Flf97��jv5��^{���/����E����-���Sz2��H����?����%��������=�e��\t�r����%�_����/2��qo��˩�J�!0��,������x�l��6���Q���y�>�h�X�g��S�G�X�Yk6˱ƛ�͎�x�튂�T�tT�z:8���x(4�7U��$콁
��8ѝ��(��Y�Ł�9�,ۑZg��Y]���F\��۟�����ns����ƅO�2A���J8l�2t�8;��_�'�s��cV��:��=Sm��i�.��|I���~�����¾�W��2Zo�82~��=���6,r+5�oN��3���1.PU�âIU�C�7�s.x5Б���u�Y��F���
��,LW���,L���0�c�]^�/wt_,�?L�W�����)Ѷ^U�eLw8�:�+̟79Ԧ�i�Ven�j��@��>}Ji���c'�쀕�]Y�4�ڴ�Z�os��E�^��� �b�d<��
���u_�`TH�`q�4���/4��&*6C������tO�d�D�fB�M���Ət��
�-�'Đ[/�`���L'�?��RtH�� ����v9��C�B�B +��k�a�H3{%���6N$�IU^��7\L�D}������]�#I��u�����*Y �x�ً2 ����$�*٤�pD8ވ�v� 2jՔ(�&3�I6m2-�و4rA��R7$���n���9���=�Y�3Z�c�����8��ݲ��G^QeNL��X���I�>�iSC���2��g�g���a���� x{7Y]�	�a*2gMIGCq�wٱM �����pg
 \^��6*v:/N;�f��?ݻ���T?&qX��l��mtJ�^��'�/��3��.�6mI�)Uu!��fl���ݑHe�(w�o�(�9V�*�i����^C��h(�᷿J�p���M}�چa��8�44=�рX���ls��Zƽ]��o6y��C�p������9C}�v��ߥk�N1�	�	���8�6K�]C�#n��1o�� 0���muL�FP(gӮ��f�@`X���Ya�q�K��$B"v�hQ����2�p�Y�/O�(������[4w]H\ڧ�T2Y|�Etz�!�E��Ԓ���� m�=�Ͻ0u�����ȝ��!�[����������Q�����7,�q��yo��� �eV;�kSS��k�˩
�>�90���w���	'�ؾ(������SG��Tfs2[zW�u2om�Zm���h�5�]u�J 0Er��0�A�\�~� �f��]~mƋ�A��(�m$X!��d)�R�p`�%����ӌs�#=�OGd����$i5|�����e7A�Ƴ̤ւr�F7A-t6��Gp�Z�]�p{t�t�M(aB2�ќ��u4�G9��
P\5D������ͳ\j��܏�/��TVٳ���b�n�-�^7�_o�	�������c�{6�˥-$����?񁨿��o�&qsgB?�G<�c��w(]}�c�����B��'�޽k""��7�+��A�E���Hچ��8�tD��8�q�ݸ(F3<-Ĭ���_�NFW[,�Ağ���"�!�*��_�iIu������N���6?�,��3Ʈ]8��� 8m`�5a]��8���e��y#�-��F�}٘�~d`�}Yg�d�Ԗ��'a�ˏJqB��*������4�2HI̦��a�	fRs�}N�̈́:�.�:�����M&ӷ�VQ��Hb�-zzt48u�%x�� 6r�'�� �H��*cVWMmd��.؉3���܊�-��*�5�Pl�ܒ!� �U��E���T%#)�s��bE�}�lmR��M)��i8xk&��$�]���Dtf5�!�g�,�vJ1:)��ǒ�p�E���&�!�SI��\� �[M�	�LzS�L��cW@�3�<��e��1���8�m<�� a=���[������?��/�}��M�B�न6���6ZD�g��<�oP�����Oko(+H��.�$��jh����,����@�ⅱU\������G���?ѵ�M�v�'�K�L��g�G�C�W�Y�B��hC��!��4#�FZ(KZ~A[_,�I�J`J�?��_mw�Q��$�'�n���np��,��ͷ�xB+rL�۰aǣ ý�p�Nx��=�X����P� /`B� ^��`}[s��)�A��^������Ai�/��<�Pw\���k�"�j~��Ɵ�:�{����6b��ak�    gw�&]��D�+�5��&��)�Y�A4u��a�͒A�2�������v�M����yHN��P��v��'��{j��a������ l�i�Ŷ�d.�l:C�r����y���-�a�Җޛ�gvt�f#%�~L�;_C��Z�����<ssl����'�29�O�����pF̙������_��'�J�k,%��� &�C���A�z� ���ժ��U�`�	R��X�$��]�Jz�u�Ҕ��Hv�?_:�,�*o�WE]N��ۦ2[�gd}T�����F�]{�a�*+F'�TUv������VGg������Ҵ"�-�r;AJ�^;�ť�V��Sց�R�8�� �]K���y�~k�Kj�Ň�_��u�j���/�Q�$��
���T��N�)>x�Ԧ|:D�5d�1S�Z�MN7���[��uF@Axb�﫫\��䶘��ʞ� �-�:Ś"5�P�h��(�V�UO渝:�ױ��Q'A��SV���r��kc�8XX~��q�_�5�Q��,@�8wS���$��E.�jR�$c�9H���T��6��e��#����,n(6�}]u?��
����IG�G�-��
�ܳ��l"�[����l����h�v�R/D��Q�$<c�z�6&'��tu7����A�����·��~��D����v��Mn�
�qr_�1�׺�0:�#N���=��n���^��j��-\.'�_�@r���l`�N�/2�xh4u�b��C>�n���6uʩ�>q�Q�<cM�S�f.:�j�ޔ4����H@3�����G�\��	�#��K�i�86v  x!��͕���u���%�Os�7��<LI�d�98e�+g5�#�K#�� \e�3��(~Մ�9{_ۿ"��0�a9������63;��}g��ǧ��Px* �|S~ݒ��5�����y�9y镜g^�9�ޱ��!z��`��p��)Ik��Ξ�y<	��M�&26q���&�.n6l؞m3�����{��HSg�j�B8����-Rjh��hln72�]
��e�#4Y"�##4��#�7ioo����'�v���U�Wt|�S��/S�
@~
�l�6��Y�S�u�B'��(�#��VN��_��u�i��$
�i�nj�����VP��V4>��o�b�-2�ҙ���KFc+H�'��ux$�*��7a=�r<s�>��wHj�f�]輪.Bܬ���Ь�S�u��~�(lH�0�'�G>�w.Ϊ|Wt��+��ت�^?}�����(7@K,����0���'���ܵ��� /=���px:��%4�6��km�^�ZbΆ���p@�A���F\�W���`�~E�O�iO��Lsww�BH���v]��R�*�7h��) �H���eq?X6��Nղ�j������Z㠨BK��ݦ$W��·��<�;SM�4�S�sW��Z�Z�&��������TłUYu�TԿ��]�<9ȯ����J�³���;�)��pK}S�݆�]�O߼#�����/Y��k) j_�]o#���a���_n,����� niR�ұ�_ۿ-|��K\Z����J�O���i̮�鿟��3�,eӫ���l��ᒌ�&�����"~��9@����A\.e�jY�i�e��ʾ���p�H��=N�/����;GG{mO������NF�'���y~�d�}NeZ��͆��:�����S���d���Bn�����,��Y�!H"�]�Y����߼%��x�y����m����A��]����-�_���6�4�,�K��+ �-i��Nҏ\SO��A�f��{l�v
�@Vjg�/� g��$/��1֢��6��"��W>�pp�e�8>�� Y�t@St8�8y<�|[Ζ�kʸa�6U��P�]��r�J�e#�?|Ǎ�Y����ΰ�*�$P	�y�����$
�
�V��I<r����*�{%��Nh��sOX.�59Lr��X�;���knt�TyG���~�"���JVZ����d3b��G�s�ccF�T>Ë}�]�Ct(��J�*�j��������9�)�� %Q��� `��4��ӻ\y~��A]���-J���ע��(�<��=�w�:��h�J��C����� A?s�:�3�����'W��p|*u�k�wX�soH��X>J�I�7n��kD7wE���Un��(p�3BY `�$��-ds&�ʆA�̱�	ǝW9�i��r�����Fe;�p�K�6�� �d��*G�j\��\
Q�O=0�q-�v�	1��M�{�(�~ؘ�l� Z��wV/�ҩnT�]�ax���{J`ad]P��vd*J,f�ƨ��
�|o{�FE��Ś�-���{x���O}l�o,N������5��NsL�u�K7S���
2��!W,�W~/7� J1�����R=-8�����@U�uxJayػ��i�ן,v|@<%B���V��f0;sY2�/���}3�v�$�����O�l�VS�U��k��N����J�U�onڬUq%PgF#$s(k��Ɓ-�*�iZy�SX�u:z�&�u. �y�>2�P�y�X�����"yׄ����>T ������}��ՎO b��Ey�2������B�ض��J�|6�7m3;[Z��M�Cm9E���Z_���M�}�T�:�6%����8���ܓ+4����n�(�4",N����e>'�f*�;K��D(���i.�V4J��ۄ��ǜ�G�u�cv-���[� �Q:������l�A��qRp���5����B�D	�	�m�{@$����b��{>u!qΥj�\te�ʠ�'Ӛ��p�3��]��@a����p�-WuB7����Sgi4�_�Xv8B��ՍU	�:@t��� 8��|_$z���,��8��C5���1�� )Ke��_�!��`�Nx	��o_�1y��k$:Qk
X|̵�K��%���77D!���X��6����\���p������[e��?������voS��i�(?8�cW�](�D���ֱ��³��%��?n}���hJb�8�B��BRz�����|4��C�q~k�Y�ŷ��iNg��xNwu�T�b�3��Ir������(g�&eה���|,u���O��=~'bԴ��dc�5��|��Ϩ��f��ݼ/��ͤ�c��DT���P��a�A	��bp���K��e��/�����fq�m�?�D��m^�7Q�����Fک�f�Q}�؁8]�HΖ)B��<�
�}�/�A�C��pp/�?6�0�Ό���O�PZD��c��[�p7����_?˷U�U�������(q�gm�$I$�!��&Ľ����F��A��$L1D\�ͅ���u����� �z~{�mׁE�ȇ(��Y��(ꫜ*fW�XJ��  n���+�E�����+����;���m���]Jf��x4��j%����ct�<��LF�O*z;bn�>�Rؠ�io�����v�N<��)����e�iw���|@<��'rKf��K��_LI��Y�u(<[o��}����g�ڌ�݅��Ύ��m*4�q'	)I���݊)�*���a#������&��[��n9�_��X(/vkdo�@F��?��֔�g�C)�*�RYQZ��y�N��e�b�Ŏ��Pf����P|�v��7���G�Ӯ��%�J�)�ŧ�C��&����	��T�%"ߗ��:�G97b���Kn]��*�j�s��Gs5B.K�s��̣t �b�9�\t�|��ш�ibb�3�G',�l�����̰��L�J�n�������Q=�v�/�$6}PRD$.[��`a��
ЬF4�{����e�߽�=��*���f�j��bjh.&�o�������!�D��	�X�c��%v�݄�lF47���(��^"�^�@�ܠ�Äyf��|�Ф�'_�ODG��cr�:iX�ϡ
�������7zU4�R(�ֆk0���2	
����h��"����u�k=s��8�N��V���8���:kh[P	{��	#4�'�����#o�}j(�jO    ���Vi�!��u��كD��=]�.�����K�.#(p�i���7B:�o�"e���ͫ��xO��z21��Z�>j��6�^��Z����H2$EC�B�Mv���NGB���+Gp�eB��͚
�r�p�� Bu�)RHYy���6��v��U7��ZO������sl�Ih)A�ؖ�R$ݪ�}{Y��c�������bR�I|E�F�[E-��� �[�IM4�v��B��p��玸j��+�Szz�y����eXϒBs�?w��Kl��ŏ<~��.�����������e�����|�t�T��3�㡻��;�I�'�_�x�kz�֢�_��<�AN'(��JY���s<���.����a��C��>AN�P��Ф�C�~ݕ.��������~?��1x�"��
��}48u�oy�?��x�VC4FT'���"��u���}נr�9��- ^�.�J]8|��F��bM�(��hDֳ�%�W9�w^>Z@/ٲKp��!E�Lb�;<�(.Y&Z\�Ǣ���EFq���-$;��M.6�t�r?m����%�,1 �|��g��i�`@�Q�:���K�i��B��1�����[kM����U��CE�VP���;"!:/0*�i�X>�� �H����'��E�ǝ��"D��ٳ�g�`�m����vߧ���M1���)䩜\s�����mn�ݞg[�2C⌊.aL�̫rK�'ɹ�A�Y�z������ �C
5a���Ĝ�qGm؃�o:���i���C����;����JZB�|�:,���ō�+Q�'�6f8�<��y�k�p�e
�&`:1Pʷ���~)=�H%|�*ʞ`A����]?�Vu�DP����A�[/�d( >�A�u��	��ĵC;��`u���7xI���A��`㧡h�)��o�^A�W�PY���i�)W��]hIέ��L�Z~�O*�	*�>�G2�w��MG�Ւ|��-kӺg�뜡|�u���m~���:q;/�11�g�c����+*w[ ����G��\����6��Gi��9�x�y��UُN�LQ���zw�/�$ w7�c�Fw�� ���9��?�O��}��p��Rч��X�T��M�5�P�	��9C$c�s��mI�r��`*�Wq�Y�8����nO�������
��$���\d���쿚�>V�+tRȥ�s�@���iF^�	c�4��ǃ�%�v�*�h<��h��pd��$��ݣ�q�;/i��:h��YbU6"��(�"��{�v�^��6)|Ö��+��/���{^�[7��&�S�h��A,��9�NǇ�H4�'dF��vE�vQ?�>��M�J����>���������p0�"_�+w)�3��ߵ��v8Aߢ�Ii��t�K�i�i)t��3��3���m�Mdm����d;b����dmSSh�}*�>7�'�}0���(�����S����;�;�2�Փ@��%�P����2p+7_�';�щ�f���6��qj�*=��8f�Dw�Ɏ���ƍ�w�/����i�T�U/��_���eiIY~�Ң7,ރ�a���6s�g�ܯ�͋{x�뙫����-�j2���3� (_����:N���]�#Dy#��^Z�&\�;��,K��{�=�`\��FTI�6-X"ez����΂�q�@�M��g( +AN	�1t3kV	��
ՍQ ��$��F��hJ [!k��+�R��!�G�h"�0�{**z�����éHߒF��*oq�����%��In�b^P��&K�E�j!�p��v�X�& �!�A��ܲl�����j���x4�4K�j�烥�n��D��nc��G�Z��L)���3`�>�[���3���|���KHѤ�&�$x��-�e,�9T:�$0ج�_����,�{��< ��|����[.��!:�.i�X��6�	�ED�V�_-�����*�}�;*��t:Zzr|ҧ��4��7��Z�Ϋlq%������Y��{^@eG7T%�w��aʶ���}-5M�$��]��һ�R?Y�<l`s��%{*4����4$]3*�nX���Qׁ�K*�9��9ڝ�;�ۄ��;�w�;�bI������j���H��G��^m����*1��2h5��	����b�r$����=�|/�z⥣ƨ<��٢����W�p);��$ͺ/�Ԩ����ٛ>��~��p$t��K��N�|��Ydp��ˍ�����āG<ġ�p��ǽ��؄�$ȵRN$oM��2�3��'_v�����eo���%o(}�k� ���K=���f��m!��X�&�����s^��ڽ�W�|���=������d�Ӵ��N$`ݖ-D� -AU�v�Î�RK�l?i��a{8�\��k�v��������И��>� T�̣�l"�0��0�Q��F��O@ԟ���1��}�T8��l�q��摎t�����<�:�Ǭ�_I~���n%Kh4=�4Z�b=���g��n����P%�{�	@|���P=���K~y�-'[��{]�9�S���g���M�q�i�jZ�"�-E�:��[p�j>t�{u���bU�9�+������T�HO*n�Ե���gHp<�#��)4.ls���d���7Ͷ	Rn��?�v7T�MM�t� ^�.o�l��-�g��!�tb��-�a�x`��C��=�wv�l#�'���@+��8n)��r;�G_=_`섒�ˠ�;��eISh��2Q�S�㢒�������
k�5�2f�A����ض�S�N;�,;�*Y�a�O��n�ߑ���\l�� �7�m�Q/��t01c�� �
��~��{� �9=��dk�KӆC�J��U&E�b�-z}�NZ`����:츊�\C(	��W�^�@,��B�֕y{	z= M�b6��ND���eS�f3xik��.3���M�(1nɓ<i���)�ti�<(�'�b%X
i�N����;�̦������dx��54���R@���{g����LU��^�x�R)��e�n �[��ɧ �p������6�v?�v��p|8Z��y�%����l����76�vN����~(,�V<��#-�+l���z���%4�]���dh���>��� e]z�চŎˌ�!g7�I=�b�o���r�zXf�R��}*��<hr��	Ӱ�]���^�h�H{�S"i95�y͎ �^�զ��A����D�̯Z�M�6׻{��� �2�%1�:y�q��1{<�?��D�Y�ͩ��.�����A��k�
�vR�9F�V)���~WT�v��s�|m��$�Lz�H
�Ѳg8�����cYg�(�*mM�Gh�Dc�-6�P6��!�\�G��hI���_;�H�gDY��
='Q�&'��7k4
�w���$[�_A���?�g�r�-�gT�A�3���C(���]Tǖg̠o+s4�{�eOr�@��|��-�XyX���%���tϮP��zX�(@6��kQ8=��N2"G���x�phN���!7�#▿B�%���O���X ��m2'{w��D=~+,,@���Ҵ[�5I=���ĵ���♥7�  ��ҽ��E�#J�X�,l������v��%���ۮ6hެC��Y>��Hh���˗��8C֎�%���/�k����f�t�ךu���ts����>��)�
lX�LM����ߘ��},�Igtz|��u#
ZͿ)�����|���կ�G�T�G�K;ǿ��^o���)��O���nl���X
Q�!��k�ztF�������f%���fu�8
ϻ$�bE�h(��Q��&L��r�\���T��K�N2�4�B22�~u	0�2��.Ҽ�l��ڟ�6G�!S����*��*P�6n��4zXD�h�(5Y.ݯ���-_|���4��h�[�ƺHކ����G�6����"��GS|D���ۗTZ�~)��.�7+�=��v����P(�D?���s���Z��ZJ��\N�OƇh�u@��W[���%�K�14y�1bH�*LVR���0�\jF�}��pZW    ����b*�g�VV�8���]f/`�̝0���K{ȵkg�/��r���'��!%I_k_�f�M��UT�u.!�&�{칸U���E�i3���@:����
��SU7]RØ����k�nv�L���)B��%����������?�G���M$�W9V=�m�Z��ܭ!���m��B�P�M��c�%�睚n����t��}�?���K�0�a-���gW=��^<{�}�d+1��6�_@�̬�.����(�]�+ g����5C��&S @���*�@O��;��N�
���=B�0Lmd��tp�*a�J����K�@pv���>ӁN�{x�t�Oi�L@q��6[`v�}tn��e�����K,l���f��	��&bQL���WNm��Sw�{aK�^50FY�b�����z���mS���56.P�v�B�hL
��j�-3b-mEh.ԙ�/�,�Xsr�D��~�����Ev�䥩/���xFZ��PK����������.�����m��d���Ͳ%썦�3�]� ��d��K톙I����t�h4~� �������G'Yl������^'z<������ÙH�Ѩ?89�����q�l�NL��/FX�"`Ƚ5��b�?N蛲�5�@�W��_0�-���8�\���g6a�y������n�D�A��!�˃L�a�%�aZr#	���*߯ )�e�Dl~�KM�"�]w16yu�w�Z!�%\�*����e5��^MT��t����zb���Y�C>� d��MB�*�R�w��l�DOY����&8m���'"�@ʰ��٬Ĩ!������ƹ��F���l�Y�"U�Y��r���U��@�U����J�X�v�9�{Z���D{5�h�%���
F�[a���o����x�Hr�����I��.v�zu��#8��������_U������z��3ݘ;��R�����g8�?l��`��%�&��X.��{��b�Z,�����l� ku���ʉP�^��B��%�K8J��qR��ӕ�w>\D	z�(ι]��櫄N�j5a<��3��� Qw��W�'����xF=z�r2�z�cO���hā�%����gމ����/K:T���0��#��	� �v��v:��_m���RЙV��x��A��z9>��$N,��,K�PeR�J���@�u�ĭr�9�5��Q���2`*V��.�E5,U��������D�����JAwa��(���2�a����c�Z��_P{�m����k�Ȭ��T�w�;�H�-��^�`0�|�#:�� ƅ/�h�9�t�f��e^j^� ���̦�����*q^����������`6#��e��+��E�P��+��GlP���5��Q�:�^�UD
8x[����4�=�hc�XgɊ�^��G�	H��76��r���1ĩ���=�km풷��jc�����Bb�z�3��ۊv����ƶݙ�)�̳)��tޕŴ�A�׽V=�O3�w�|4���%�fk?�R���7�l��p�b'����p����������ky7��� ��Ι�a(�N6�a�j��k �T"n�����q�v�����징���b�;fu�-q ���:ǈ�ky�PX��!m��D��]&QJ_�����ŗ�@v]| �O�� ��#uAq�s�<���`��L���%����?��|@m
���r^.��p�\�+�5S��� ���@�'˙leb��9�i��P�4m,(G1>�D7����:��L������k�4qֈB�1It�Gٿ%���>�l��#aa�8T?����c�d�L�}k<:: ����i�,�l9�OI��T�Q�No��)SU�xTz�m�+�5���$���EY�H��om�MhW1�����>\M��N%��(/k*r_����-K.3DzҐ���2���$��S��?��P1�K���`����������{#�֖B�OFCD�·���j3)��������xm�/H���Ӯ�
p��]1o���u��'�3?�ڲ��	!�mef��
=Y���J`<���]T4�L�e���2�JK�@{�9�-�{�S�#�ő`�U'�-�j�M=Y��k�b��G�<z�c��2��m��O~�����({	����oU�����.l?�n
t8�n,�0�F���j�mh^���/毀&�m��o;���ax��F�x��&�
��#W����i��j=�ն-B�~��-��>�@~��.D�Dz��p��vY�+��TڱL�}�9PQ�}]R��g����s�6��ig�9��B!f�ej׳��M��'�)P��%ul��|/#2� �av��H�4 ��<�_��<�'1/���X�&�s�u];�?��NOG���+�ߔ=�FYCM�f	ʱėD�Z����k�8k�c$R����wg�M��a���^��.b�Z&d�ڗ� (o�vX{��2(ߑ�@垐�҈�}(�P���<1�y̡3�Gő���JAd��&�x�mNCrԛ����q}����h����Ʋ�)�!��Ք�ʦ��n+��~�Y�X��W@/�E��.�v
5!�X����Sʊ�Bu
d|&9�%�B���*&���B��>���p��K�,>W㐩�$������aF\<*��/�$B[xE��B�1Ӥ�����9��Y�k��� >��u"k�U`	:�e]oW�߹쨩�����*g��*�{�kd���j
J�^��4 ޡ�`?��:�3K��󰉅P�($&yT(5(�Ǝ$�er���!V�la"΄����P�sJۃ`�ݛ�"jj�݅�/�E�)t2bm˧g��H���~m���^$��Q�>4�iW��&#�Ǝ,9�����BW��|ԑ�_ɰ	_��7CЛu.�_�]�Hz����J ������(�Vŏ?2�hy���%!�u�����}�O�\N�Ⅰ~��D��ǈ~RE_�UUp�{7ߨ�G�����E��4L�97X�wE�Qh�H*�]�ʰ&`K�+w���mD!����f�q�hzڤ���ɼҴo�f�*��6��)�Ѿ������d|V-(��_�g�L��H�&�vU�0��a�����˞�5A�m	�Wŏ6~9ٮvm��l���o�%��#*�x]���ґ��ѡ�Ã��{)#��P�y������|���#���a�l0�p�,��6� ��Q�L{��B��x��[nK�;&�$��� ���º#h|�+��������p;�A&P�� f�~�G�υ,1Q�G��A�*G�ɔ��UJ.S�h��ZqW�?Z-�TZ
.�Z�a����¦r�ƿ���Kcex�u��s�+[��_���Yˌ��u�����M[H3R|Dw���|�g��V�c@��~],�9�1_�/��P��,�Ň�ӣ�m^6��e���ƿ 1�jWD|�N\�b���	Tlıveo.������ķ������*�Ż��M�gr!OBv8-|F�?���9pg�0J!L�me/����6{u�3���.�Q��sbˁA��� �lV�@㵛yz�7���S!&ƹ���������?^e���ն��ND�����;n�����8&��Ҭ0�z���W%��wh`�� ���/�3c�G��S��e΂*=��'b�=&�@���h�y�T�;Ƨ'�R�S�ҋͧy�r��Ҕ���}�3'\]�F�|�4��k�{��ܷ��8��me���bR`b���������;h-�@R� ��6�'����֢��
f?j���ZK�1��q�T,;�a8��V'�9,H�H4g��M��,�b�s
̭?��/�B�����²���	�h�F���~�d15��R��o�E�+��={Ϋ�{�:�a���P�X�lU�'�~���� A�Z�}�֞l0{N|�[����2|�(��$�Z����h���Y&�Wm����^�	,�I��!Ȉn��F�b��a/��$_ ���04P�䉑��0s)�,�'9��^�:���� �\�U���<��d�u���O3��$���YE��O¯���=��4����*��Ab8��kYN�    �����}�Pѵ���c/�ƴ��w�R_��MV'�n|�m�}�e�N��SGF�]�ڪU�
f�����P��u�O�GnJ�������,�͵�ش�␨
��t�"=�㨘��刮`�����wH�HB�s7²#����_9����@��fe����]���C��$}��[��ؽz	�k`'2���pYJ6[��3Ms�1(���]��u7�1�(�tэ��hGi�vD9R��Q�2�e��J���@|l	����~Q�cp�5$%�e�Ff?v�[E7�r�%��4�����l��#F'*���2��A���aD�hVq��7���L����o�ϥ��v}���c�ll�Aw��l�׽�TA�mE�0,�����h,��n˧��:��
#ˬy���[�����2ۭ�͟P���I�������������_�.ݍ��un�D���$��y�\"�$�`���VG��V��B6�W�;�9�P/2�eO�0v��.�P$����ֈ���yrس���F���*�Q�3�ӡŹ+I�؝+H��(��Y�s��T��w3/E0,%|�F��m\(�!���s��y|#��]���0N&<�{
,�(%VM��K�⧠����h�xrv��.�ԀEK>ES��v(�Q�+rk��q�AթrM"�=e�}D!�h6��̨H�
x�	4 �4tx��=��.7��������[����H?p�%{�M��Ѡ-��4#���X3��������2��F�2�@3#{����O�laW�qW4掛���1�6��Ƌ���3�O�Ã;�-�`�����fhy�v��@ǲ���Zr�%��I �ūb�B
�]Ũ�>s�kSu������|�ݥ�2� P��I�-Js2�|>ϩ�r�}1��@v=c�������.-,]����c�ؙS���x��6I���I����)��cIa0v�W�1��T��u�x(�]#;QTU#�{��a0��\�7��\N�
`m˥��§��U~�R����@�3�>i�!�d��S9>N;{OJ��(t^����뾄����(�R�1� �{�VAx&��W~������*ck���"�e"�R[�3�,���[���,��!P�s% ��\�ҕ����_iK`
Ld�������� �6�-�hde���80�k�2-��Py>$����;���o����N��h���G�v�`�0�i,��B�b{�Y2g��C�)uf\{J�М��Ur�i7C��5j��	�*���
��G �� �\����H�/�����	��%쳂T�4�E^Y��SB0M��n��Uڳ�B�����ol3��Aogp_��)b��!�+�Z.m��M��d8�~I�N��}eh>�k�;2���H8��]�iL�;�H�Z��O�$e��Ó�
�6..���e���asOO�^�ҍc�osS�ռɯ6����k1���I(�C��J���SͰ�\'��1�P�)������]�4�uh-�C���Z�	�Ϧf]�J�|ssCV�u�ƒ���>q�6jR�(�^��7�B潋��ՅU��L�"������i��3����1H���hN��(/�!K�&�ȡ�1��0%�jN�O�Fl�S]Ѭ�o2�^��|��J
�f�b��}D���BJ@���;o�"�:��X����6-�X���d�x`jF�� ���$���n* ��{�%����`�B�b����S�Y�ʽ)��҉5S�����8k,��!)BG�!^+��aFó!.�0�&�yMli��׳"�b`��S�g�a��h�'�>/T	�Ei�RP�q�aÑM�D���[��\����:!�X>*��v��Kth ��T6��i#O>˵��0��w�%�K���v9Z�4�")��|�y��E��n�C���Ol�;�j���b#�O�G謾\\m�n��\�4D����Bdw��(w�h�� �<���I-BXw�<nn���	H次He��0��F����!|4{K� �:�b�y�������x�+���m>�t�rr��Z�OA��&�W�e�Eȶ��l�����������]FU�u�z�(��e�M�V7i
\k�v��E��n5���|^�\�����7w�4*�M� �?�����IT~�@Am�z��wu7d�@Շ(r�
�K���p<>�B��CH��<��'�nZ^��s�������ݷ�ڍ�FS�@5�`�V5���Q�����fʅ����D��Yh����!��p�řo#^�jF�(�p����������e9�Q��h��h����6�BEq[������|)�ȁN����4��\����^@���H0��Ca�M�`�]B��R/K��� h>�뿇h��1Z^�p���v�w��Ej~��ۿ�lO�٘������>�X��@U�p2D�q�Qk�#�QZ��P������r�`1�ݹ�]	b<��ŴյT�&gL��
�x��˦�s��9bu����B4`S��~����|�(f7���pħ�S�uo�'�1|�0�R��|5�]��RA�9wZ��%Ԛꂪ�Ug��G': ,�D�Sa�㏸���&�/B,f�Z��3��d��b(Xxg8�5J� �e��{I!�D�V[��=�l�D�,P��vZL[l��&���}��/�V'��p�����%�x&���j�L�@ō�ȫ������]�^�}����B��e�A5ΩW"J�"��n�t�Ϥ�2c5ձ:%w��f�#4�?>��u|��6[B��}F��V5ߗ|�y����J�8�o�}Gi-��K+��`�|��^!S��4d/�XV������R��d덊��I�~+��K�8i҄���|�%+��d}�:��F&�J�I�b��$D�;y80��s�٫wLhG���]��]���6�Qu4.����%-DQ����\3�V�S-Y�%��RbeI�I]���J%Yi#�k.�]�F}�S�6�QDm�HhA��=B&��7���>���(��n���\�
AO�8��3`�I�_yw:��\"�;E� �R�̦N��x��c�羝�̲8��V���*��2;X���\`m�*���4�I��f;2/.��w@�׍�$EXHJ����w�7�R�;w�I�*=:S�&�.��]ڧ�T>��;�}Yx�"���ΧGϬ!�be��Z���"u1��/(��f��������y�.e���s��_e�o NM����;o��u�B���q@��ȸ��Jw!�O�0P��6B�!��.�gRNx,K�I*�?�Y��������u�MN�-h~���O>�6
R(��сtaTǬ;:<���[o�!)أV|��p�#z-���-�Z�L֩��&Vx��.������ �!n'ϕFI�2����v��Mg�B�E��l��q੆��l	�tS5*^�A���1��cKO�a��N�k�t.��I��*�$��VDiE�3�<\N�T��@r]S�o�L�4?]x޲�r���EZI;
tÝ���%�8����@f2��0�ʖ����)fr��l��P�<lvwp�)���� ����m���":��M���J@������pܷÞ��E%�݃�Ѧ�w1��|�/Q���A �ۍ~����|�?q<��"��|�H�~��⁓��ޠt~a�;7mH}���!~�j�>��qA� ʐENa;��f�s�� �1�6L�S�G����-��V%^g!z �W�k xZzk~Ƙ���L��O�{��<j�n���Y�<$Q����Q��w�� !�5�}��c&=VV�dåU6Zu<�L��Խ˛_v�z�������R���W��o�������?������/[�e�����?X�_k/�	�Vu�m�&�6���G�x*o�nZ,:M=�F�B_���42�]�����z�"����e�۬���͠�'���߁�)���n�p�tKG�t`�;��Σ���r�-���/���v�����h�%��H�f-�+�������8 /�KDH|�T!�Ҵ~]^IU��m��@f�g��|8����l���U5?�<j�5��|6����]�    �q�+\�y�}��:��Ý�1tf�{��i�s�/�*��^5b��v��W�A<�>�l� ���� f;_%}	�P{����gQ;��:G�^��%mh�>����wI���v��P�+%�%`���5�L��'.��� �� �\�E�O^��!J�AK� wsP@p�h��I����Y���c�g�)"]0j�,N�b?/��+n۞��U}ۣZQF���ĪݫCj��B�g�.�UG�S��F�������:U'�gJ�Z�*��1��F`�N��f޼�v�^��{��D���_���ab�?�x��Oz[��\/���&��B�u����_����WUj�F���]J�;n��E�S$�2=��F�a{a�6N�+��s9�H���FX��r�%��w�Q�����m���1�'����9�V�c6�J�3���Kȥ&k�P�r�@˗y7Ik��_^���m�Fx��%\1��m�ٗ��jQ爢��]wnF��ս����'G��b~�}_fj���rz:�<���B�՞f�K��̽dY���-ؔ=�2KC���o`UD�u'�Wy��+hKGa?&�p��d����SQO��p��]��\m�l�ƫW�Z�F-�y��\�!�P�5�)v$'��+���^�s�Yz��jS���Q�O�N~�H�7$y����d�4�[�2Vs��)u���I.�����������Ӵz1On?�������~�_�G�b��c��(�+@��m�����E�XA�(o���۩�E�棄��$c3������U6e�{ <!�e)�#U�k�j�\I��*d��|O�d��|�W�+�+�C�%
�x�R/�P�bӑ~�zmX�d��ܰ�9��j̰>9��� ,��ncÅ�N3b���f�J2O�l�o}&���?���I嚌���������#�7���^�rYn�߲ U�3�F'��z7A��-�KA�-X1���`ɺGLAΈ��߽)�E9�QH]O ���r�^���c?�(�I�Fƀӆ����LM7I@J�Tj����ޝ)=m��-�_-�dd(�T4��[���ZvN2�)����|5o��37�m��Ш���%R/v՞.
�P.�@��sB��c��|"�x���c�{sZ��V��_^{�8K����`?������v��-{�� 6��&��	 k��g.�D��2�y�Ϥ��"k��s����kI>��`��(v/��rG���{�: ̿��tN�n��u�Ž�b�/$���/$!׫��6��$�i�kF�_)B�S`���(⒱���xb��w����l�t�Ii����6�q��։o ���t�&�,I��|��+X;��U�7,���m�z�e ��n���:ߥF84���:�O���%�D8C:e,S"�~�r��Eh����v~����,�de�yY�W��	Ҳ/����#vzA���O� �h���F����#J����7�dÌ����:(_��N�^��dw��;/�,)-�K�����8z��y����@�Y☽���(��V�7g����4v���npV�JeQ��]]��X�v�RGh}�{�b�g�p��� ��;��m`*4z�p#���:d�������U��x騑�N�<T�:���{���Obʣ���b�UP�N1�)4Q�������P�M�]�
�T5����F2p�zP�E� w]�<6�p}߲��,kXpM�V7�\��:aT�BA����d�@=� ��]/D�Ŗ�/1�w8V��R�MˣC��<uh�]1�F�����'uӯz�w��4&:�h���"�y)������`CL'&_(�}���̋�J��h�ԅ���L�'}�y�*G/�����(2eI)h�/�5/���������zh��S
�9�/�6��<I�rj�pl���7�G[O��77Fh���˕��`�%;-gy���>]�x�3
�F��Ku?���3��'�n}��ɑ���������y���V��e��_��:�$GQ.��^�+�+^���c��K������5��<����J���^��y�>Q�z6�Fa�	؟u�P� �	��.fmg�`<��:*����jsS��M�Zl���|�0����	�t|ȬC;�Lv�D��w`�R�P�'�ǳ��w���a���>�ҙ2`�:��̰`YZ�U��9�G�'C[�{����,����'�u t���1I�i�M�p���,lb�Ȯ�d�{�x�c��t`��XՑW�L�1h�k��D>��<��Z�����xp2�������:İRv����7s/!A���0g����x�6��:����aQ�,�[�nx��:��"���^�6�����my5����5{����X�|�����̈́�dԆ�#��1��H�(BB�XeD��[Y`Y��m*���ȡ��'2.��VF���a�U�_���+�]f���c.��4߱	����a��e(Ux��\J�s)y��]*ď�#�Π�-�6��5T%��˳���tN�%��'�Q��C�}���/K3������rh�t��� �����*O�ܔ,J�7	� Dк�L���%�3��F�3'�Y�"k�\u�F,d�6����Kj�"�EF�Jz��S�Dۗ�g��(�jp����H#+��t�v���H*/��p֟簿C�BR��uW�r߄�Z�]m��c��\��M�;#pg
M�,���B��.Ve5�5e�ԟ�\�8�P}�"�ۯ�t�1���+��kH�د���r/������T�hew�_o�_k�}Zm��d�w�O-0,_3dl���)&� fEi+sԉ,>�؅�ľV��6o�J�dT�����y�
Bt'އ⪩͍ڥv�� Ӟ"r�.���&~�tU �KnFx�$�K}.4nm3��;�7"�v�>_+��Q��c�.9�0����߬�n�ȏ���@+c��"�-0��Sm>��7܅�_���K$��Юe)��+%�Y�&s�N�E��KOx�/`����33�A{z
�����&��-+N��atjX.�m�z~h0-*�n��ƨ��^ۆB���9v]�A�� T[�/�%���e��	�>�ϲJ���(�w?�~{ ������2&�+��Ð
9j�R� �Kt���]JBʢy�r� ���'����w2v��^���K?>ֵz�J�����ں��
���}�n��y��o�ť�_����w�!^�W��R5���:.-V��=���;*��>�.6��X�Sن���pxtt�O���2q#�'�W!�Qf&���Y�����bQ� �R~�
�!'{��:>xX����U��h�U�n�gI��ś��Od��ztrz48���r��>�g�{I�7e����hk݋�V��C�J�ՌR�K���RcH+��h����Y�sw��]W��VD�Ƒ\�HN�ı��F'�h�+�PiJ��8�5J�5�q3�hé�.�.ez)<;�]���1Z� ±�L,���/Y;��7�rDu�M�,��J0��+������f�N�s�ER�:YB���2���y��u3�N+�~�|l��Lr�g-�q�A��|A���TY�J8��~�Aߴ�5�m/���&ӑ_�a䤬p��'��ƈ=&�����[�STu����`���1�~�%��*B���94ruC������P���L�X����#����������7��������?�ۿ�w����E���76Y�_=��a��Fˍ%(����_����U�������?���_��{V��<��\5���fS����?�SK�_�;{�����������2���s��o2�S5qc�=�wPꐔ�03�����J�]Y�?g���/��w�{���2>��P�"i�[4�]%���b�zc߸�\T�1v��H�.8�Ah�1�g��p_�l�5�����ѡ��)�L����U��F�P-�+WO����WP�N�e]����]v�]�R�c�'�T��&z��7 IfPBUe��e�H�ݞM���j*J�ͨ+2���I��I.���Y�R�(�V9���XQ��    _�o�zC�vA7��y�}���B@��w��6O��ϻ�"��F����1P4'vDw���n�¼�w4����`�ڟ<^�o6%���`��5����:z%���xj�.E�6��d���g�����?W��`�k���a���=���*k}6(��6K�'�pw��n�><��}p��x�c�]ڱ�R�G��O�p��\ Q���%�>É�A�F"�-R::�x��K�h��%P�R(��Wj�$R��E(͛ہ.�ptSE)>ڮ���������Bn+%�X�U���5��������t)�M}�ol��D������
'�?�"{�2gh�><@��zѾh��-�;�5"�˿Z���Z�h4B� ��!�����}� ��_��Be	R,�y�{о�H,0Z���y�Y5I�3�e>
so�6��V��n�sڬ���xIq�J�P?~�}/3��u���3f$�G�D4q�߿=�(�S� ]I϶�zĨt]
��̇vqUUk�զ���4�s��5�_�Č��3S���2����T 5G���dBöP�BTW��@�;<Ja����MLt<V�K,�����M��{����V�u��aV.�dz
"�2���H�-������lQ���+��)�BL%�μ��]O7�ӯ�*�Au����$D�%���� -�����Y�_9Y%TR�dm����P;,v�a�v��mtPpx;��n�S����K�l1k��/���T��د<gŉ��c��ζ6n{�0ئާ�̽׻�	*>�A�X�u���G��^�/������s:Ў�~;O�ڝ���M
�:̕7�hWv���p��ގ��J�E�����,������*o��ѥs���Ab!��ټ�A�a2V��)f�R4� i&5���Zx�|� �h�ƾ.խ�Q��2eK"qSaA�M��[�s}�/#\αkʹ���60y˦�
�8�cq-�(h+� �e���VtN�T�}��6������y�k�]����4���܄�<�[�nd�%����2��5[��
�����soJn�r�㛢�%���Sc���:�sr����{��"GS�������1���$�C� ueZ\�)J~�]h��>��m�?d�M��M~nc����9r�������C���=DX4\�׿�l/;���ڒ�ɭ�p˕f��9��S2j�U^|��BOlZ�D3���C#���W�-H��uD:9;���ғ��An_{���Ú��f�=Zt�~׋"�'���j@�THJ���R�K��$]����T5zz�{ЃCVM7���+H/�o��r�f�xl�'���|��j�{�����4�q�.��vQ���V�w��(����T�ݱei�����A�t�S���_�U�@ �&ŋ��:n�\��Z�7%�4�\2T7U@��(��q7
�s�J��:���'|�>���/W�O�Y�a�����.vASBY���~�6��'���\ݔr�c�f?��J�u�6��7rZ:���"����%�ɼ�<��)��ήs�$!��-b�o�d�0��sBh3�:�=5c�O���i��q �$�w_*%Qڻa����[�����g.�(#�'+}�[���?���^���pqMb":�y������?;����@�p(��uֻm���'#K��V0兕��;����nr ��a���2��ɳ9��-�x���QV!-���ߜ�L��'���0�~�]��]��+ �����T݈,T2��-�ޤj���y�0�QB��bέ~�U��-�J�җA;��TUJsΎ1�R��n�Ho9��HA,��.���2
�)2$z|#k����\宲:���-v߰�y�m�;���Ԝ^��]逸34h�ķD-xtbS��EK<���~��3,ekp�ٺ/۲�bse�K0:������P�9(\�����k�i<w�CDP�x�m�rQ��	ɷ9��D�s��q��f�!�p|�k�{�གN/�k��C� [ܕ����v�edK���U�=�u&�F˛@�<���9��c��_��^.�e�C_���޲:�����v�t�y�}]g172cS���q��J-2��xzc���Դ�z��7Oξ�������ߟ=�S*w��z���*�B�6벹4��-K��.E����#��&q�z�m�?�Ո!�Z�6��@�L���A9l��5��,�42k󳽾�}QyŹ��ih���Mzl��ٚ�Я��с��*zJ�- ϰyt���H���Qvx�G��[�'���a}�Խ��qG]7�d��l����m�X��²M�Ƚ��%e�w
��$����ךrn]�I������'r�«���mY�پ_bFB�=�ڥZ6�вt�oQ�X��#2�T�A�կ��e��ʥE�z���7�����HaNa���J������N���%$�0���ܬ�y@C��u�'ݵ���tܑkh[�vʵ� m��U��������9�dp�h\�T�g�����輣���W.v�?F�'�!N��8�lU
���2��������?�?�jB���b�-=���)e���/�`"׽�����ڵԥ��M�y�:�q�z���̂%�[n/H���.;7�:�����$�:U�c�\�J�����B�P�dI�(�G���K{����9��p=EB>�O������m�-LĮ��V��2�"�u7�dOk�Tx�}���~y�����6d��v�'v�kSp����ƕ �c�z��h�Z��E1�@6.��+|�s�#A��R8�t^"6�l��Ҿh��q�n�;9N����qg/}�^�L�o�Aŷ[Ա�����
R�7���{��D]
�o�4�rL\G冦�Q���+k��-��"���O_�<���U2��o{.	�@)�=D��'U�Х�3��s��;P����o���D'���W�� OYY�`6T��5�*vb'�����,A�T�9�jR��i,ϐ�X�~����w6�tR(�De�:&Z�Y�f�lW�61��B�����f_�P��V���!ˎ~�����5��|�k������	��XMZq�]��@�z��o':�����H�E��F�s]Ti�֛�g�uj�"�)�L1���I��*aCj�N�Y���蔼oY;z��X�om�+�ni�%sO�D�0�E��*�t)����0yE�r ��̃�fђ�e����3�E�;�Ci�5SM����'f�7p�7Y��G8e��!v���5a���&Rٶ�r�,�rD�N˃y��\�Pi��\%�܋�U�&�D Ԝm�:�Z�P N���r;�t�j��:Ǎ�rc��r����y&K�=�F��\���Z��vC� �|�s�9⍕�ES���q�_7m�糖��K�v�"0؞cS;�6z��  UiJ͆�Z��������h-�G�+`4qU�<ͯ��㩸`*���E�'�*@"P;rZ	uKb�>)��qQ���I�Ӧ�-��S�q��h�1��g7�[�1�;ր��{�0�EZk�Kt��+_�V�8w�l�G�a	�:sXq� "њ��i�Ʉ��}��R�H��+s,(j3�y^Q��LZ@��>��-$m ��2�a��	°|��6Egp*э�@*>�<���Vu
(��SAת�d���?���ΕC�lɶ�l��&�@ +��n���i�ht:�(.�D� qH��t�̰�Gʚ��H+���ǵc�����>W�o��w�ZE�^Bm}�h����O�g���å4�:ApFF��S�@���?=y&�����\ݳ��L'diI�]?�\����v�,�8���d��`�E�a��!�y�TC�
��e���k�Z�r���:ܴ����KE_y��W�I�����u3l��3Y+��M(�v>����߱YS8��b`_���=D����k���
�R���ϝ}Ԉ��lrE��9�
��,��Zq@��/�,�(*�Y�+b[�W~����}>�gJ&��z�`�h�婖�W��@�O�N��dEI5��"���ٍW�ˈ�m�`�i�{� E
  K�vm?+V{iU�]�vе�Ղ���b�Aܮ��/0Bi����甦c�4P��\���,������N���V�8�vr�Q�V w�/e�N����L��'���=Ks�$M\���}6}\��<�K�㛃��S.]�zxp�޺ܩ_����p����l��&��P ��9�76���'��eQ�`��rA��=dŦ�2_�y8:���\2��k0�'P����D��D�tr8��P�J��
�=�UPW�h�a��g�0s>M���&����~#Y�|?d �@��	��6k�\l�Jq�T߿.��c�Nt1��<����ҍP���BP	���l�{8���ف>_��t����A&�e�᳻��o� s�xoށ�%8J�M�e�7*���%��F�u��B�'�B���t�\�t����zN�G<�ˈ��CxUڍ.Kl
2���i��`r6K<$.��]���=��-v|9
������~���@��cp��:��$otAŻxe���B�fɼ�����x��e��~����:���6�Ƚ;����>K+)�L��`"������ o�ſ�ņ]�^ ����� t��v 깫<�{�O�(U�� �n ~.����<}�P�[ 9�`�B�d����p��C����:rm�'����-]\z�K���@{�n*�S�q� \�R�ðti
],�%�
l�geFbH��!Eg��^u?�u�f�v�s�\d%ݹ�^�&�]\D������3�J�?yh
���_�0��}�׮-�!J8����<��������I��v�lU;�7����Kw+~�t|����I��px|tt�9o�)�H��b�p1��.�+�"��=��E��J�vD�nD�lAmZJĒ�:Q7H��ԣ��l�1%����$�_��cK�N��0f�O`5,�@�s�3�p����.���+���R#>R*�銙�l����)�,-.�8���C�DWw���,I��-d^�7�D�]"�Vw�Ie�����)����P��㕇�De7���[�iW����WE\&��AI�4����-4�u�PRҏ{��S!O �)gC�m�c{!c۸��WT������)�n��w��xO��� z����j�֪�
.=e}�2	�w�hmZ������_�EE&�]V�%�!�|,���,��-?�E�U�l���W��4�x cKu�HM�e�iI����|3�aY'�K�l�y�C���9/
�V;l�u�}^I�	�����z�W�}�HQ��BWʻ�7̮�X���Q��fc�������g[~F�J��֫x�%L�<�k�A_@��O�+ԁQ������K^($��D\�q�Z��8���Ǿ�p�Ha��C�a�uڋuU��{�O��*�O1q���|]9���=>�"c��e*F�������uq�����vX+�ٲ��S�3ti(�z�B.�M4���x�(�Q&�؃3��^)ӟ�%�K����N����<@Z�V���֭ �9�Q��zq,���dE�|6)ꙫ�:�/�\Yc{I�ʍ�ҭF�t������;�+��9�H8��L�o�¶;.�����	��Ek��F��>c�i�o���̂�a�j�/�;�oJdZM���@�iͽ�n/ ���اP����EC~�Zrq�y����-�Z@�X�/�u6!�d2����}���T�����w�7�7�5v6��q#"i!$��P ��$?P�]�?R�K$+�E��*��B�=5�R�l�����+b�pp�TIfp沺-�e��>(kW1Q%?Eab��d�fǚ�y�ow�'oX?\mVUdj�K�����¾�?5BV�9g㟬B�-�]��7��	��:̉�6��xm�Sx�"t����z�̘Y��T�n��	�]k��#F�tUI�$3q�q��Gv�P�m��by|l)�p�9���������w�\ DG�<p2Kk���o$C��x<��o�l�gvt5R��LG#4xt�p�V�u���[���w�B�T�F�v.��n��`��YM�n��Z�k��N��mCf}.�M�|c/^����Tl�-��`ڲ%T[�A��ۯ�Q�<Szw�vڶ���F,B�k#i��N��%��>JVE�>�7o�`�^�O��5�	O3;3ɚ��d���?���`�V��<�t��|��ۇw���S5z��U�ĭ�ƈ�����^�OLgl֮lqrD��Zj���t��F~���� �'O�m��$�o��������tbae}�M�L~���=��� +�\��)�ȗ����,�L�&d��K�[T���A|�9�1���m˻t�_�Rc�7���ks��b�M��/>�8��T��^E} lk�Em�/�wCYe�юY�������ᗴ�xB��P|�˭��ٕ/����f+N��$����p`S���w�����+����!|g��Gn)�dkw?�Zt��&����~؋�s��������M�m�[8��8�2��e{���k�h����;A��I�^"Q8�EY�X�B��&�������8��O��e��g���U� m�0��w#��b�s����b��8��=�ч��nO5{���w0�]�g����~����'�      �      x���ٕ�����ۊ�@��y8F����D(S�]��ϋ<�HC z��u�������1�/�5��[S�u�P*��������bJ�g��_���_
�J�ƑK�j��
�!���J����L����O���ߔ���)���_l�6g��P�g�����_�ߖ[��S~b�)�����B�W¿�%����q���Bj���r�ʷQ�u����0���7�c��ԎP�=�q��X�KM���*.�֟�C�_<�2�9�1�~�t����"?࿐����>��ş����a���!|C.��;�G�&�	h��b�����P��H��(�2z�k�Āe��_����V]/����x�9�w��J�ja�Q��?m\[�����	�k(Әa��w:A��u��/�oH�����g`Y�y?�f���÷b���9b���xw����uw]/�q����B�7΍�
�_����gO����'�.���SJ���~�۩�x����o��s��`3�1�O,?|3�ZI�� �y��[��=�/V�@|�
[���\x8l��m���\y�Gh`��+�[C�|"P��{cvݜlQ��IX
y�r����	�y-9W�Ү=�2��ɽ���UQj�ѯ��@*_H�α��vnL��-F��&�ֳ:��� ��ψKW���f�=���r���e��Z+#�O��~#����X�~�Z��[��T�����^<�+�R���(S���@����G�a�(�3�7Z�7S���k��R�[�z7�#,0�{�<�o�>�x&��������X��I'W��UBܯ���;�����`���=��O��+ʹ.��h��-��!{�`�b�+��.c�?	��ck�C�G����c�WB��r��H�k6n�Ζj��jX�?)��Xy�'<���ڶ������c�A��&A9}n�����Js��Ñ�YX~#�R��M��qF%��ğ�=�S���Jk�=�����F��:w|����M���b��3�{g�q�
t���2�'��	�$ߏm�����>"��;�/����~�	G�|pX��{w<��Z�
��8^�Bӆ'���K	�WUi]�^A�;_�C!8����O���Tޯ3:8�q�a��x�a9]�W(?����[wz1x�tV�:�3����#V��U9����~�[��bK��ϐnW��<C��[�(�z�`�<�}`7-5.b��%�������Ypi,���n���k�׸������΄T�rK��c���q�W5�٬1\G,-�<@���Q�x���'ƒ���;��.�[a����_=@��<`�஥�����Ǻ?"oMĿ+�Q������D:N�v �L�6o�8zƈ}��p��w%��WS��P���^|98��9���_�1���`'�skBW2���;_�^��"˼�:�����h*"6H���w��NmR�"��jڇf~Hs���bR{Ls{��CYo��T�q>x�Q:��I[ɗ��á��b9"v7Ifn$.�H7 t�
�
�K��i���ºeD�����U�L)Wp@[+�7˷�!���mH�
�LB03b0����v_�zcϼm*gHW�'�7��b~�`[��ǣ VO�)�q�c���`�U��w���t��#ӋE�\�;��Bq7V�@���8�}&��"O�}�nS�m��G��/@��1����m��N�O��V��~C���0�����gD�G�w��y�ƺ�Z��Љ�Z��r���a��?�Ӆ�B�.H �]����*�Q�r�O�׳�Q�����1��L�~*�%�zs��0�����ȭ�t������C�`�b�=���o�-�GA�lS���Sǟ�dY����!�{��Y'�/�h�-���Nٜ�L`}���hڈWH~|�qOÄcy���f�0A��5�K�P�4R��#d۴t�V��� ��:�VO*X�ۘ������?���hԦJ�$�ܮ�Ǖ��@�Da��^�A=�W|��<Æ� �Q�Sa�c���2`�P�5h�tx�k�����z����P`�/!��X���h^[�{2ZP
�i����G(�ﰃ�"��rg��vN�KVxpX�(��#w�p�XG�x����?Sv�&p0^�;�j.)\�PP��Cw����q܄w��뤳��})�y�h;��<�r�o����ѓd���Ѯ��CX`X#p2q�{wO�	�{��JN�y�"����c�������e��x�El��Ұ�ě����a��
�	� ��;�l���E�ͱ]��]��xe�����|��<9�۷�����p���db��,��26�T��Ϗ-XݻJ50˂���p�> E�[Ƒ��D���vD,OJ�c���$��gHF�*���s�t<�_�U&�,W���m���k�Ւ��
��>�v�Oݧ%�KI*5L���:��|����Mcs������?���hK"c���s�P�'(gH�9.��3U�հD��hv��י%��Qj���^��<6x�F�7�7���X�Ϭ6=����;{ei�W�܂4��A@���7�Oڅ� W.2sMp����o�6����-L���s7�-m���[h�G�	�9P�X���R�QnX���� F�}�!j��^$�e������]�+�R�$�.���'51k1�Ire0��JM�2Cs��<C��l�lI�a�2ݛ�,)N
���.�Ͻz�,ٙK/-�;iZS���� /���#j��N�|.g����P ']�ʪ�;sqv��n	���R� 5�R=����G�^>a�;��r���mp>.{m��+rYK�]0w�ňbqDᚱ��ƴ�ff��?��v�������z��L1^�8-e���~&��!�#$��Ds����,?7Kz�>�Aن�۵��:��j^��Q���A,�ψ�齼8T���8�w�0�$���>�n������]�f�FOg.�"E�A> ��x�t{�qE��v�8m�v=��ڋ<Q�0��w:�2�׃[T�8Z��T�H�
����E&'3��|Nz;��E�rA��9�)�*O� �=�| x�	��ǇR�)��fP>�g7\��]��2�H`��vv���S�����s|�'�+$��1�L}�g�X���z۟�&� ٿ�Ӑ���1K����_W����­8Wb��B�{}�V�\��8�qϸta���ny�+I�.�0������ңWxD��q?�EL�9�3?��lGD6+�P5�H�wg�o��W�3i��<F�Ɗ��PTA���+�����+�8#W��y:�HG����Z+���!�ņ���h�]T�W�e6�R���V�嫬	M\{Ҫ�{/�߲�;�RcMJ���O�g�!�O�Y���߷�zP����؉0��d�q���-5�Vp����Beݥ���c�e�rf^��
����Iw��%=\�Ҕ,i=� ���Į#���B�ɏ�ŋ[�Aed�,�¶�"�|�,0�A��1��0[�ʕGQ\N>MeP���`�4��,ɮ�3�C�K/ߋ4���b�^rr�m�+d�����^��|j?��x��f>;+,��׎��P�'2��l�tב�����.r��l{υ��%�
��}�DU��p����R?Bt�x���}�э0U���s�Y	z���V��VQ)�ٶ�Vl���'�����N����7͘�s���׹P��p�>X��rv�$����aI�K�C���M�.,��N��p�\�G'�@c���g�+w��m�c��W��n+��?��l����D3�z��"�_:���GfâJ�/�E���nG��B��NqI��\=7,�������K(� =8�C�ʟV3�����m�i ���P�����:��_�)sE"����f�;�����s���3	��;�t�y{��4��� �+c6X�H3���d<�mǱ���L���ٖbU!�Xba�r���&`&�w�k��t
�Z/ ~2;4�s���� �h	G�N��ky�ni�Şp�xIę�L�*d<�"Ѹ/`N�/H��j��KE��3�G;�z�!�:    ����Ue�c�e�Li�t�(�\P�	�b���-��+�D��,0�Ï}��D�܎fs����}pI�|���M �ӎ����åGF��-[2`��(����V��^�PE	�ҫ�"v|�$�+d\�˶�\S�!��eŹ�I��l�Q8�.o^ϐeV�
������vo��'Z֕�̿����@|v�$���Ua�:�6}���t�����v�6��Ыȳ�'���k$Ғ7_)��mR�(��I�y%{_ �M�T+�v����������*e$��	=8{Ԏ��'h�|ց�	�VU�>EyL���IX�;��� �6=��1ܑ"ny�� �Wu�,CfڃP��km4�큠S:��M���0�y"�����M	��UT��>��{��k�Vm{HA��"���x�yj ]b*�2��T�4�&���a{�9��C����-|R��;�0E�R������d0ϐNS��|B��p��_l��ŕ�f�:������ g]	4!(�l߲/m�>B�L&���� ��TqV'0��u�}�Y�+?)�UU �dp��n:B���֔���$(��->^�y8'=��x�(���&�~�a�q�>��J;w��z����U�$N������!���EZJy��W�����i�z14�V��]�6^�;�����T�� ���������e
��fn-z�b�� 뗝=��|ʖ�]�eF#����. *��0P�����G�`�˃Mǯ�u���?Y>C��bs�#� �[,!��Iͨ�@U�5�V=��!�q��9�(�;A��>8G;.vod�ig.B�q-`�?L@\�@��7�R<���!� ���+��aSyd��Db+�QT��V�>BU1Ơ{Q6���F��dYv���.k��Cu1��:���y�$j�DGL��p$�	+��l>BAm`��+�C	�&ϣ��� ��R���烊�2��7"-�<�T@��Z��ԡ�Y7�J��l�Οj��˷���D��#�����gu)au�m�HxdG�;�J6���;�����߾�k�k�����o��N�4�2^l �U,'��O��6'#�����k��t��3/�GL⪅r��d���5X��Բ~e>�3���tB����|�,��,����d-z���fvF.�3K�5�Y���]�e8/A�$7r�~�yZ�)P�B '��y���(�sM���cF_Z�g���,�4'�y*���xe�la �kԴ�;$�jaB�]_�?��`o��av%5�U5�g�����X��V��9
Y�g��ڐ��B�XˢA�;���E�e��W8�����Q��
:�����#� o����0Y�7�FdŢ������/�5���N�D���pQ��}��;Yxプ�kX)�w(\<�N����YG$o���<��3��A}G��I�!���+x�}T<�����lu��'�g�i)���y��tYu�ȬV��	�ƈ���J
�z�-��������Ხ� ���W[
�N�;X��SkP�k�;�O*�1蘌xy&���9��i'��/PBCUԓ@>=9\�1��F�������8C�`���{��bprc��=��r��2H(�\|ߌ�ro1�L�u°��Z���<C:�2���J��_J��_MG
s��د�#�ѕc{�>�|��~G�[W��+dAG6� &�e ^��tWB�Y&��i��~��/�u**5��t���p��/Ž̸�J�M8�m1�+dU����+�l�ĊrI%%����#������ZG(32��p2'�{����*軌4v���Z�ROm�1sg�n
)����m���RՄ�,~�f�����W��]�c7�Z���%�|)�&~1�q��]Y�~�2��dQ���y��$饌��2㭜]�z^��j�bG�G���*���x��4�ݯn��C�\�ݩ�EX�ZѢ�(�-�^��k3��/�jpJ$2���j���5��
�3N)��֦D�D{�X�z"Є霮������o�f���etD���d��]�oh ��!���c5(I_Ȟ����H1o�%ţ� ���T?O�IN�X�2�Gii��u���xw8�a�<�X)�����(�׺�R�!��h��R"�֣���S���ENb���+�> �]"-�HP�Ȥ��w�����5�e8s���C{J'!�JQ��_����������k\�����|�W�39h5���+���͏���b�����b��LN� �Yi�`��͝��}<��J��N�i%�'"0H;cj6��]����@�x�$�>����8BAم�'y���7$�S]+���T�
[�~'�j�Uga�!�KO�(�S�;����v{��#��̢����t{�.3>5)��/V�_�U���*�YS�����^7�`x'�ǉ��Yc4� XfvzcAQ":���A���%���LS?C⽓hI��}����r�hB�X�WS;B��x��$���8�N�A�?�BA���0���!���Q.΂�;m�� igc�;�Y/	�t."Sŉ!�H}oeQ��85�Ձ��qX�L�%<qJc��]��>�7v,�Yue�y��������?K$�:P���58>=8&I�(�e5����H�Ų����M�Px��D��ҷ�c�w�թ��v��o���vnʪ��F(�ɟ�ʺv�ˏU2+6^�,&�,O����B����1��X`?��>(�W�[}ӑaO���?�@^Q��45��Cm'|n�i/�uw!��R�,VBh�a�^�Y��tݍ�pB�r8Cv��c�T�7��)�IF���B�Ghu��V:DYI�M��PImW8z2����~Az��-��i|GV�ũ�!���g�:�%߂uZ#�o0���}�j��ę�l��g�&Ҧ�c�R'�.c�z��sd��:������j���UB�ݝ���?1cb��LT򉌉vG^�_F��c����|����_��u�Vyz?ӕ",ԥ�����sS�? =z�ɮfXW� (���<C��Z4�j\�d@�����cR�8�stw��6<�۫܍;�ɗ��a�}��|)�xH�h�o�.?,�9��]�>GA�� Y��I����kw�����W�m����� ��`f���h��)>#VX��Yo���G�Ү������#ع� ���{�� �6�xB��r�.�W��r�a>B&4�`iT�j����Ԫ�����̊�/��oI-����n4�'5�nէ�rR�(�\�~� ={�&��m���	!��Ę��+d�%E�FC��{,?G�Qԓ��vxo����������"I,�T�1�;p-E�
�u�� g���g�W�J���9\����_!e;�l<�g�i�]\Q��c�^����z�.?��_��f�GQ�
+J_zZ�`o��r����
/�2�Q������9���0�.�GȈ[9���x�M=�w)���Q+���K1��+.9�D��Q���9[Y�I�=
n�]/�����C�Pd���#"R=�m�V�������Ų%�sI#Ӊe�B�.�hl��kӵ�Yq+�;M8�����e����2��>Te �ugN��܉��!�RB�R@��`ޚ(lŕ�V�Q��qg���0'h>E�r�,�Fۆ�=�(�j_�'?��jz��H\��3<��6�Ds�Q	B����^� ����&��X�c��m0��K�.�R[�:#���&�zR��>��-��l������Ć<��k#������ז
C�,F�4��
d�PH�-����w�'�*�}ՒLC�����>A�:Y��!U!~vS��\�N�؇���PХ�H����+�:n��.ZU���7[n��V��5�P�dJ�*Q����2����O�,ظm8���$�P��_�Ȳ����؂2\,k�L%�'g��=|��Tb�3s�a�C�~��p�g��_�a���:@AdԪ�DJF~G�r��FƱ|�yD��#M���L>�XƵ'ݡ+e��3���~��e�3��v|O���iX����Հb�g�Y��s�`= )qF&ݒ�Ӈ斝bc�.�y�� ]#)t��    �������⥵��j�E<C!��6�ۏ��}����U��c}�wH���Y�%��hHr5>'���%�\
�t�B�E�z��/&�׾�(fK�����b�M�3�x歊x� ��j�r`ʮl9V���k��_�2}=�b�5bXlS����m��QB��:����Cu{��]F�h��M��&9ٷȊOř��ҳOZ��݉2�/18b�i�t��Ҏe��dR~�� >d�=9��-mDw�5'��"a�n�������b�׏u�L���q�;U��,��7�C|��KlFk�Cx��ގ�f|��(jQ�=�d�TI��nA�K�|qij�ͥ3d-�1<E{��ҥ��1ř4�R���aI@�Cq1�"��Xk0sS���9{s��J����#�v����P�<ũ��|[��RZ�SP+��"�~����8�7l7:�ͅթ�7ҟ6;���u�B(Z�g��b�;�yW}��DP�_�yI�t�ʥ^/*E�%���$=��Pե��(�!>I�̰��SB9(����E��jy�-3�/���kg.XB��%�%��<s�b
n����=B��`������l��S�~A�F�ѹ��Uy����C8�����Ka����F��C�0}��\+B%�z������tw�����{/�r��u��vD��Su�3��P�������IT_9��\S( �]We:϶�fl�pX?�(�%�EY8� �ڃ��lq5H�(����U�����o*�ж��aI:�����԰W��խ�*~��-K��椅+;�h�#��D���%��"�Nku&�1�m��!Py��#��ѣcP�M>��=��/��l�����
q
��2���O_g$��b�{N�,b�D u'*�Y��t��,ے_�I�a�H�.��
Zq
L����6U�x�6kY~��������~A������Z�b#��%�	Y"���9j)�����L�vr��m�K[�@��(k���fתs��Lj� w6e���ғ� �}�#��K�����e`~�1�G"ˌ�p��w�#�B$}�&�,�R\���[��@�F�K�3d&���Ѻk�u��BV�c9ֽ#p�dc(��R�T��Drm��+dxSˈ���]]jٹ���=��pպ��P^�V:�!*��Eȟi�� ����G�J{H����x<��ё��ݝ�D]bH��t,v��,�b�!5��V���3���*޴���ۤ0*�O�5�֕q{���2�w��Pƹ\=9u.j����#� ���4�!(��D&bH����*���5"�1�P�T�Mqb3O�F�gH��$�Ҁy�I���79��z�԰�\9&�C�9����ieR��S�%N���hL���e6���h�"����)��"���v���>e�ޡ�&f�ڑD~(��v���j0�j�G�?�N �#d��"yD���Ҧӕ#�
�<�Zt�W��x�,�[	'�]\:]�wۉ�E	����{�h��P�*LXA��P��*/uwV�0���Sy�CZ�S��\�XR�v�Q?|t�Ҹ�@u�Xw�a1mL&ތcЮ��+$���ڷD87��6�"v�rU!Xr%���Ƀd>F��J/�v�ru��&�WČN�ֱ����!��Y
䳶:ڇ�4~���s6U��EXN�i��u�*��0���X���1+�U�_���k� ���I�~��C:�a���Y�����\� ����D�D��<0;�9��5�Ǿ<��}�oҔ��"ݮ��,��f,�n9���d,j2����]�G����(���V�SlO�W������}&Y��ʞ	����^T9B��]��G����TI�N~Q�y������K"�2隨,~h����O?ؕ��������0}��"����E5� lN2�]�Yr	-��Y;BkB�z,ǜ5��SqFvɉ��z��v����{���E&V�C��ړ��̿������*<?��-2��_.�n9@V�`^��U=��I�MuZy�&�Gk��4S>BQ*U@�@N���s�b<b���Gܸ��x�,?J]+��)L��*���3h���8��޸F�zE�k���m�'W[�bI��5y&�:�:��|��l����1�ITu�I�=u�Zr��S{ڐ�z�L�J����2�5� �sy����nV�nߎ3��"�˭��%�$��Xvi�TDN��E��.���9�QUȝ��H[�rq�������j���?z�'ﻴ�h�d�pZ��@�F�
�[�K2�!a�1YV��K�,�fj�����3�״���
7�Â��i�DR9X���P���m����@��xe�f7aI�5n��G��7���$fg3�5e7�qb����6M�,t����!�3��$��'3O��n�%�c
A��a�ą�5�,��\y��f���F��P�[l��� �ӣ��sm�V�T��b�{��p�����
NS+K���vذꑑ�ykqڜ��S�a�������q���Y6 "k�����'�h�IJS�u�K��mK�ۋ��2�r��_Mx�窒Ss��VU�����ڝ^��\�S�_�wfZOE'5����.I4ΐ���΄�e�a���Lg�xҿ.=��*J�-ή$���z�2jC��ӺFf0����e���+SSgfV��5v&��`Q�VJ�U/B��P\�Y!:}�
J.��X�j�� _G=ʿ.|Mz�u�8I}���t��0+�����a:�\�Z��bD�q�>�_Sϐ��(��9Ka�wd��$�RR�)i�]��ݥ���.�ԄR;#���l�q�&��u<�2�+�#d����7�@y?��5:���X�E
T��&ݮ�gH)F��*�<�h�ػ&[%��泶M�}�V���)aR�������	7g҄6i�����Ef!�;E,���N��pJeFb}@�)��ec1H]U�X뮽�U?|@���/��F{�Un	�����Ub}Cl����1�qOQ���!��c���DI��\0�,�Ce�1H02³��w�Y�h�ƥ�G��)G��GȆ]�0��(	�a'#չ��@�5����4��ᗩ"< �U��f���2R��_�w��5����L9��G��?���**K��^v�����V�=D>9;�L�y�5kpkۭ�s��B�%2('͙�`"�������-c܂5�Gh5c���Px�CJuo9�[0zx���&���%�^�/�|�o[��O=�5`R:�s[e���#�i�CG�??%��){�Ŷ�:�炠s�D�-�"�w�vA@�(�����(W�����r���	�E;����aY�s���5�ҭ�߆/��?���g�Z����5;8��u�#d�*K^*��/��|��ꕢ��-Ael�#�.�$F�D �>d��@�dl��p��&����BFHf5�#@c�\V�����ٖ�Vb�饪�6��p�6���0f�;���t���OU��9�L���g�?�.1YyΞ�o9���%����Mx�ltr�S"h(k/J�xX4����R��ܱ�I���4:��3�}Q���ٔ����XT�W���=ؿ���Ǉ�v��Wz�^4�0Vn1��n03�Z�[R=F�����C?@m�V�k��y�͓*��te�[�뭞��歪e������=�=��q/��V0m#���ѥ�JNGO�o
V�D'?cnw� ���WJ1A�����Au-MkB��sla+;r]�5�Bq���
�7���g_���Z�(E���c���f|�ѡ)9>�����5�u�D�ޔ|�2�#��n��i���)I��^ó�l�DQw�#dzt�'i3�?�!d}���[��Rk|Ɲȴu��R�#�⇟�����������8|8o�gH%%���
ǣ.��{�`^R�{��>phG$]�Q��~x��ؠ>�l¸��t;���K=���kS�踶oo�jO{�l�0&
`��JF*OΕΫ�H}�6�T�3blW���B5���y�Љ����3eN�9����L?�Ezy+�g-��<B6~�J��t�
���	��R�Ո��~N�������l�*�E��N	Ce]6�P�6���#d*�����Ř��a�x�    �垶�YB5�K��Ǚ�d^�p��+Ɇ��G��ū���1��)"[����b��q��>#V�'-:�Z�%��(?e�ע�;E
�"fr)�x��@�hRJ���j$�G�"Ϳn�zmqZ�8��X�?�;�1���;�2��]8@K�_�V��
�x��<ӧ.�m�6{o��-O�5A���ZN��]��`��T*�AW��5I�N)��6����\ZM:T�E#�"L8BFI��]�0��d�Ae��e�?�݌|l�ǒ���JH,�&r9(��`�u�&<�G�~�l8B��IP�r|8���fs��V��+��-��P[=A>H�FD�#��ɘ�5f!h@,a�Z��)�k|j�A��+���E!.�lʴ��U7-Wq�Rl��djK09��c�&��~�ѥ^ ��dS)�]aG?<Y{s��=�Q��$��!�!q��1�cG��kw�+�pΌ�tJ��a��M���;��G%K�`�� ���'�T!������Ok��c���)���_��YJ�Ksi��������U�Ȫ��`�����D��5��J��--zBDWL&�2�M��?ۏ6���a녺ε�QgH9��+�w��e8?���R��g��o��$
�͹��Ey�����@d�Sl�`)N��l��1��;��K��?��-��B�>ǣ���%Amb2	�9㑪�wI��Aj�x�8O].�?Oê���49,��}��z1.��W�$)����L���\��S����%#��k��;dL��N��ķ:T����nx�O�GDI5������X�4����϶�'���e<A��d�j���*-(_�JY6�|NfC��t��yi�s���uh�$wk��Zu1�[�z�SP�&�j�l�;��غ��N��[�77��o�
ŴT����rBr����H	�ʆ�iu��z��X5S�$���m�b���"}��٠!�⥑y^�K�����́)����튾x�yK�ũI���p��s���l䪌�7nj��vӵ���d�R\�J����(y��Қ9�i���#�v�~�4�ϨF-�MO�����v	��2�����V]���H�)�m����Yd��2�[�7=AV��ٔ��6�Pu��H^��3k���!��X}c��SR*��"b�Ot����1E(�7��6^ ��d�^�t]:�|�9Ly��dͰ͎&d���B�i<3�ζ3�4ҍ��f��kE6idh��]m���d�S��$�
���O:��M��zs�g)��t{�t�=e�*����v�p�H� }�����
����C����dc"��?&W!Sr���Ȝ2S������O`���c1���#�RL���w��&�b���v���$�_+;e�S��	N�H�����U&y��pg1�s(�a?b9����(�4����N<3/P�<��<Am�c���!�|<ҏIs��r�;[���W#{��(� �zbS_M��;H!�>�q��{N�CNx�L&Q���v]2\��˟��1�2> }2�5��N����� /9�o_�(�H%{��\�!Z}�;�f���m��ܲ�W���CVE�	���Of%�df}�&}�?�ﮮ	�q�����0V��4�̶Bf���8�5u��>�U�Q���<�S��oo!J�/�ވcr���? f�$�Y�1��A�ؤ��I�a'�m,���9O֓�bc|��fp<"3="u�bg�-�xCR]N�5��U��8�R�"����T'C�Ɨx��xfq�]�dR���f����W�C�ۡ8R�<60��6�ty�Y�&�����!��t{1��>Ǖ��0�Q�v9��$N]��k�{5�x���_��ku��I� ˗U;���+6`�;]��Y�Z}!�dG�J =���c��ƀ��/��j�y��V�������;irz�P�*5������\�
��ޢ�n]����N�1B]c����H�yBLÓEf�."�ȸr��n�^kJ?�����w���> ��,����2o#��}GV6Y�$�[�W|4ZF'e��b�p-[����ΐ�Uar��rõ��i�=�+`����yD��g�t>܂ɻf�����QU�bb"�N�.����E����\�ftr�Q�a+��TT�az�����^�5�[����H�	Wp;��X�v�����y��ևT�1���)LH�j�_s�N�(^�#r!qߩ�CNMw�����D61���V&��
Y~)�Ӳ��rd��Yƴ��zss
�<CaI>��>3
� �����N͠��8 �+��3d{Ԍ���\PJ��4!.=��ԷL�͗7.�;d�U5��f�P2�ޣ�&ƚ��ں�TJ���H��3�+����T�~)iEs/P\�c���Ly�[5ވ�iX� Il$yUnSgxC�k��� I�03���1���H��w�]�+�~���U�A��gӎK*#���9c\
���y�Y�I�l�$|��յ��x�Bu��=��7T���R���z)�y?�5"�QXT鹆��6�2~L���l���!�Rhw-��`W���}C�b9AA��
�sUKpM���������ksg^9C�K�
�ZC%c��@_��m�C����+d�I������ڙޅ_r��ؙX�#�x�w�v�x1�%c�g�����
:����(��f�cwz��T���2��8���d''%lI�*���7dI�w(�ɋ���I{7�^���X�K>����B����
Nm{�&c�o!�� ��i�F�wW�9y!��_�@�FJa�}�ڴ5����Jwy�x��zG��k��x�d��!���E��Fk�_{b��S�^���Rǝ�]&�:��d'�S�o$���	���\Y�ߔ�wh����a��8B6�s���\��/?�N����e���h��4V�h�"�}�EΕ�����F��s�)<A'H/8�%�{��x��3i�@W�S���2J��U��|+!Y�M�Ը��vE��<�+K��&��8S�����Z�'�ɛ}b+�>H��A�N�)$�"17ny�!e��Y�O�#9d�5y�Ú�p�<k��Z!���z���(҆�-�W^��ݾ=� 㽦dLk�5ܶ񶓨�=:(��������X�P�kJ�y�Ŭ�q!���:Ӣ��V����ЕN�,Gl�ObG-�*�;�V_�jw����6�3D�V�D��kWVxn�&�Hl���H���n(g�@q��K�M7�"�m7���R�YM\
l������'�~I�2�3�V5��W����1�=���L��b�a%f������n���ⶦjǶ�v	���0a#�ߡkT.����K��X����?�b��t7n��GH��_�D���F&'܄D���ł��������Lk��-����Nk2ծ���,s84jԹK��C|�U��;��#��j�5�Xΐ��(N\hd;ժ�Ft:Q�{9�v�mk-[v����J3��˩�����0
b'
�^�Ө�YS��t=���ç���� X^��K+��cf��{��f�!��8;��je%���q�ZW�w�1<�!�ɸ��te.a�Yw��	� ӈ�^�=�*�5�RB�(@�����J�?=�!���&>��s,��_!��U����S��]�Z�������nsg�-��
Y�$�D$_.���\t-�a�T�E����Ꞷ�*+}D҅�,|��*d��a�'���Y��g(_��T,�ʄ5���
�k��țQV��L�~��8e]�c��L��P"����OO�|��H�Y���l$Ƶ��X���J�u�vk���WH4�$7����w"&�o	��6q�Q�k��?��W�i)�Cm�$����V#�����kc�;F�v�u-G�_l�x������i��:�B��C��7�~������
��k��''vїxvSiq?x?C6�Ss��+W|���xv}�d�G��F�?@&,c����T9���zZ-������(����_�g�q����+���,�>��9^3�_ ˮ��d��02N���Q��R E4>K����Vt��n����~�9.r/���2�t���
M�w'FGr$i�zC��N�y�s��{��Ws�2t�4�]��    ��7.8��Vw�݄Sޡ+^.�Q.�,�U.[Q}��8�ݶ9W���Nz5�*��f�P��� �*{�l�$�+��qA� �Cg��9��ǹ3VK{�╪
)b��P�P���9H�2�^b���`�5]���iE>��)�ͳ&��K�����]},���ޙ���8�>J�r�<J?kpW���/��Tv�0��LRɓ�n��yҲ)[JS���!��N���L�'�H����2ܖ����mU7᥯����uTQ	�~d�5T��N|:��S��܋}J�#��D�78s��C>*�Ƕ+&CXu��<��H4�W��R��%ҩ"��oF	}Ng����+|���+d��i�8s8M�ՙ�\m�$-Bt�s��?�� �;�\]�Re搔����~BB]�?����2q6ip���48?�휞���n.�������9Vd�2�g(\9^μDd�c~�a��>��[m.{AlrU�O�����'���[oV����嚬�H�h�����!_9�¡'��������U����z$�B"�ݩ��l�+dZ�yZS:�/��T�v���n�I�W��'�?��orw9�߈?]���.�mu�R�{k�������L�t�;h3��L��"�c�A��j���i�w��8X�wm���Ke�
j*u\Z��;w��@c���=��[���[e�%�ϟ�ܚ�^^���a����[%j	w�}�-HAԏ�1��lc$F��dV�� �vU�ef�VِL铱X��������l��ћ�Bs?����ω��rr��*e�,�z�ö��Sv	k03sw��,���'kVM����:������J��@��!�ک�KTl奧���&�]�::�E��_tg�Ra��N���Z!��r�� ��#�1Η���.b\��+VU�zķ|\�%�`�&L��(��\\�0,-���ҋ+`�#d�aS��ъ��񩜚��z�5K;�:�����.�S��t��"f<5;�陏�����-|��x��^�q�J��&�*�#&x�ƚlȬ��H�t��M׎ίPp�(� �K��3$GŚ�a-#V�}��r���N�i�Z^�UL��lls�C�5`� Y�!�H�ѻnpR��� {�������o�5}Fm���XN4a=�Z6^�*8�M��!>{�ַ�� ԡ	��׷��r-��J�!�GbH��ĥ�LTa��k����|�A�?���N���ZG]�E�T��­;�
{�4e�S�4��[��:
�%9�x�kM�?��i��	JƸ�h@�7���b���k4�-��W-x���{�x�B���@�Ă+wZ/���$c�Rrq���x�,�*!�G!�"�Q?u	��bi��������E=�i��6-��1�|O]�`�C���m�h�	�Ԉ`	7�O���ײ��*(�Y�ӟ����-�a�"��P�ĥ��q�Y�Rj洶�ڣM��Z�;��8o��G�l�k�k$�������1�y:/����N��O�r�4w]�|%�����`�
Kb�J�r&
�]��c6�jLd����Z���o��-+��.ܮ!l4Z_qϐ��j	<�8લU�q�17��F�+�����5� �,S�"���o�W��:)��������Ȗ�pEۻl!�L�z7g���^ֶ�
��q�IO��f˗$
T�i��~D�HE:��&
괢~Ǹ�ɂV�y���L*u�,����ِB�P��aXVN�3	[��I��y�L�1��V�*��p9��qD,�M���Y(��8BFY��ΩL������'��^� �s��r�~A\
)���x	*��r��A�"���H�0�K,՘�ه)��X����3d{��*����PV{��i�&9��4؝�*+��Y#sַL��'[��q��M�2Z���+Z�;��-�~�q)l;Ӟ^�t,�̠���5�����i��`�&%@r��SPmA��,I?Ͼ��k�&��}4���(�	\��i�*GTӆ� �
Y*5�S��☮���>��� ��o�\����JyQ�9��l ����n(��,�n�X=Cy5�Q҈�U�몜a�N���N��e�C�����S�")�c���!/n�ds FS����� �,Q�X��c�|Vxxp4L�D���oM��<�C�#t1�Խ�_�ᨪzυ�&��=HK7�C�f�o��0'�n�Kv
�j�$�։��S���O,ƙd-ա��=;��J��6p�]�
�E�.�_�(��V ��yZ�'4�o��	P*�Cy�$�;���tm���SB�R�z�أ�'`]�D�ߢM�s�󴈩�����}T'(�[B'�����Z2��@�]]$��5܈=�	�@Vx�:�;���k���x��~M�X���sJ����5+<V���������/?�	��N�RG��	?�h�U�@���Enja.sǒ�7D�G�������r�ؚ��dŶnk2�C�/IǍ0�9�9���u�7ˏm�L�ׇQ�]x@��7�&^������v�uG��a+�ƻ����o�
�.�����~ �0k,1?y>�WGg��0����	��#\#X��t�Y�u>gj����񝮄�N�џ)(C���Y�W~JuVA-�e�CtC��<C��MGV�yӉ!kp�ZDU]�J�������L.a܃��]t�[���J^WɄ��}ĕ�P�X�I%D@z#E�u�gm���$��S qO<�� ���ph��8�c�ש������ǀ�dQs�8��6��~<�+��CR��z�
1N�Ze�UO������%�����&��2�y�t,����D���gUq�A��$vg�<��N���6��\qp�c��W��h�#���-�m�29l�n�M���7�N�)��Ԫ�1^�@<Ŏs������8X���#�����h�,�`�p��9J~����)�,�;����e.Թ�ទ�=S������J)��<�PG�[����������g]����A��Խ`
X�~�-��2�o_g�-s��j�k '�����\ʹR����{v�B9CR_� ~�={�;���4�BVS2���ޡ�XA#��|cVd��sC�ښMM��1�بW����E�~�,ZiS��b�E��Pf�SC�����n�i�T�b��i����_(�� <�HL�*�,Y�eh-��~O=��!�
Y�95�ǌ�=gt�i�����s���Ŀ@�ھ`VԖ�a�6'�&��6#�yi�2U�8? &�����1�Y����:ɩ���μ�!�p����eĵ+w��^����!;|ɾ�"+ �BFD���3�[>U�+s��t�:(u�oS�6�	��j�E)ppm�n�:�k�m�����S������C�<�@�65f�\Zrc�K�ކ�ۏ����a�H;I?��X�z��pp�:٣t��-��e��}z�NΖdR�4��	�����ޡqi���9v��a�r��whj����"���ٟ��'�T'���Q
o[���Df����o�j��#d��b�qj:ΫNRCq�D[͆f
GJϙ�L�3�?�Wf��n��|�,B�Q��}�oUCg�ގZ�B*_��i��\���q#?���Q��k'H�c��zh�p��}��~ ��f�y�w�M٥HM�C��=�{yD� �&�t�WWY�ˡ%�q�����j_Ͳ�E\{*�w;7b�n�h5:��� �8	��������>]7�5ٯ��Y7����]UL�(8J� �m�f�I��.�����iZB�j5Z.&��k+��v��;Eꞁ�7.�5�@�bQT/?.�-�#6�y-�U�ـ�y��ʮ�f���	�����?��Q5M���'u�|��[��;H�h����ie	�L
�jz\� ���<CD2T����}��؂5;A��T��noPv1;ʛ"� e�Y�6��oH�м�-�W��Z�`��p|�|���-5�ԯR{���܆O�I �;��q��0r���l7.]p�6�����>���d������;I�+�C���t?����)����-��_h�+g�������u�m:W�GPz:`[��3�嵜J� l  w8b�wx��lB�����Pw0��������d����4�Q�kW����5�\�7�Z�J���W�#d���kp�T\[&l7è�Y~Net��7�H�'I��`�$�g|��V+�d��$�C���w����n-�D��ͨ�TUIK��9>A�X��Qo���j�=�]`�Eo�)�2��L���R�y'����AY��4�<�<Cc�)8�pב�"���$9���ݦ���K����$+;c��}XLc��p�w���Z���qI�u��ɼ��G7w�	є�@�r���w���Z����u^�Z_��%.���I=���qg�2�G�Yv�c�p�C�M�1.iJor�c&�o>=|��oo^uĪ_��Dy��(��;瓋E�\$�6%�_eP�'/�]l.��F��E;�~�e�,�:��x�GȺ ��wR���t�����y�Qqy����6��Z�Ք��t�4�`n�GQ�M�4<7}%�?CIƓrאͪ:��b�&Y���ǰ��! �b���9�!��b^.��k����s�E5mv>�դ�#��66�V]0��Jk>�(�|���ω�.+fc�Ē���9z�����bd�j��,o��u)p�-���?�g�Ju���)z׋�蓛veټ$2���[d��=�� U��]B{�1I�b�u�*:ΐQo4x�p��fE�|;8�҄��!~��������5�$��/q$��*vKz�Տ��KM����J�{\g��[h�"+U�9��Y�AJ�������^���N��z�8�-Q@1�=�|��:'��Z2��k��Xv2�$)i�^K�*�'�Z$L�3��AcJ�'���橂Ka��\0�{���%�0��#��<����,2��5a��C�\�;�����l��<��jJݢ�F�䱮�~-$�ijo�/bg�r�L��\h�m��SQ[��Lu7?b�w �3-]�G�˲W�11�J��#������f�&���9�A��C�Ⱥ���}��h��WPv"�vf��S�/G�F�d5��ҲW-Z�>?���ٸSի��3�W[c;xw�l4���R��qN)�[r����fz@zr�;^��t� %+��j�-�Eͅ�I��L�n��5K��#��p��,�����ڢTՇ#$X�BGv���P0��&f[i��j�!gbͅQ�W�Vy�����YYE�5�x���m���]W.�<�pa��7Ȝmz`�����[�7ű]ˢ�p���.�5E�τ�AD���f��O�ƫN�
z�}�Ǧ��YNZ���CcleĎ|�+��>���̩��vLQ�RgY�(��8������
�FefX(T\ܧq>C7I�rF�QgNÆ\�]�WV��y$7�8�'H�@&��>�����%85$�R��5��Wh������<�����\0��Ǫ��M�����FWZv)C��A�,���8/q��t�H.f�nU�2R��M{Z���v1�lW:�Xr�'{���*%�z�R.�XՑa!��R���&��ɵF���ia�����_!�af�i�>a-�/���e[F'Ｙ�b����ˢ���2I�'��II�YӮ�G\�#b����;K/��l]�4׻c��W�h�fsx,�B�Q|�B���u�Ʊ#u_�ޡ�*�l�簡�]p�J��5]�f�.ݘ���z��5W9�&q%���,f��Y��2}�(���HL��o��ٌ�k��_�ݢ�����gW��ҙ�\��9k��O���u���2�B�r[�k���y��-7��Ik,�1��q�9.*/G�ɷU�3ԯ�yd'f��v�2��_�;�Z���Ȣ�����-0�䈾\B"LWPd�̯�� �qQ���2ͧ�~S7���'�R��]i%����X��qc�����;Cvwd�#��q�S�� ��W�X[��?�=�.��p�&>7����I��ǓB�m[6��WIQG��:�b�&K�.�H}O[R��"��s���� jn����P� \�(�������l��vP;l��X����V�z����\�|� ����r���uE��U�$��X��5�3��9fL�!�v���KP�������L�+�����9X�,Wl����M�3��kp����M
Gv����������      r   j  x�]��n�6��ç���Z:��� �I���%�""�)�����nv�
eQs��p������B�7��mg��/�:�����륯McN�л���Z4�K�QH�ѻ�NU�±��թ����=��h�СSV��hTa��/a����xD�������=
���	��xJ/RTҺZu�gȠU%~��MָRI]J���U�����z'U���V��5��(��U�h��
�mы9�o��,D�Kc)m���9Y��0��g��3XI���m��im��`%��*+U*-Y^���D=k�eQL�|ϲ�X�\���앁���ɦQ�Ģ	jq�-:�����Rp[�g-�Tc�@UU#�'����Ӈ�q��\����Dӂ�0�0��\�8�e0YL����ю�)�2���5س8�O;��ު_�Cg:��W�h�:���/c{�v �eBIb�k�������L"Z���	��gٰ$�=��Zӛ��$��̯NrT����cJ
Կ1�\���\)s4曥��Ԕt�{��o}
�N�Ә>�P�4�m�zaFR����ZH3���څ7��1KQ�4�a�U�('e�I_Ҏ��B�sP�s,���c:8�b����cNk�'"K��K���|X��kYV���|C��s$��]�=���3�CڻF�,�h�_�vA��t~v�
�C��`˚�F��_���]w�Ӕ�d����)6�R9Vp��>�jhzV����)m�J�!1=S�7Ʋ����;�f��ep�1���0�.���Z�U�pk�$�3�5���7!�x4�"�D��h�8�-蛻PEu�
8mR��u��h���7(�ЧÌ��ƨfn����p��wa�6��!R}]�cDobr��Ctc�<�����#Z�B n�t���=b���b4��Vi/1�a��?Jkz �H]q�u�:T��?sW�Gk#ܨT��=^qHq]�_CB�_�i"	Q_ekv��$spu뇏�ʉ����nd?n(F(����/Ow�8x����o�M�	L�A����C�alƷ~� p0u�'���j+���\*q]d��Z��L�_4����Wwհ���-�&X�`W��= g�u���]i��$AZ��N��_-�)\��o��1�}���@��&x����[�@!��,���S��䉇A��	w��������@ǤT`w&>t�����N��/���7�;�: ��+m�8x�)EY�=Ɂ�Eu�s櫮!��8^�~���w���%x�P�香 �1w8���g�%.��"��lZ�~�pP��NayHO�Y��� %�/�ܳ��ז��Ϧ����ӓ��1O����9��p���c�_D�>      �      x�e]��#=�{���~QԵ��6�8 e��;�s��U*�	����孽j��_Y���������x[����ƿ?����m�{����֗�q>3�+�����q�O��:��y�c�oY}}��7{�k����3V�3|��v^�SJ�5^��?�������~珍�e���3���ߟ?�{�G������������_�?e����.|d���ڟ��V�[�x)����^���|l�;~�}f߭}o��Wp�����)������}��^�2�z�[�g�Q�ާҏ�Ox��G����}�q��3�������N�>��{��Y���~������u�>�0�Nu���S�S����6>c�X���k����>N��
c��l�?���|��V���5�˿��Ƨ���>����;J��� �3l���Vy�u�+����;3��)8b
�(�b���)�΃�L��ާ�9q�xI��w�m�/�g*?S!D��7d�w�����6�S�
��>7�@� &g	I_���R�pe�6pL��yL�1��6�g�wԒ��?���¯׾���k���rel�7 �Ёn�w�O���p��|p�Я��נ�\%�������-�1|�L�Zԝ� &���WC���	=��������$ �x�E�֍���_����Y7��k�]K��c*����5��O=��2�V�v����J�q�(��~��_���^a�`���_m�3������G~f�G3 5ݟ]���M3�xC0��V����7�?�������^�޳�������nݿ:FH��4��7����8`
����o����[<�2�n��{���z��y�Q�
��Y��i^!#xu��7�^Я{��a� ����x�V�[�/H�Ѧl1Ĩ����3�������P�k�B�i��цg!�z6����?�t����������e?�[tq������?V_0VnW�i� ��܀tW�'QJ�P����ǻ%��A�-�3uB;pJ�R�6�E��&�2p~����-�Տ�קA��9��}ns�dl�?� S�!����c����m<�C�u����]�*T�ׁ�C�!�wd��6�ɱ��xC`R�k��Pt-���������Y0h�S�F����'�,f��o��}���޾�w�1T�W2�����T�U�n��� m�aͨ���ڣ��]k�hNk�3�4<����̉K\������?�/��e�i���R6���wJ�k�3u�2�B�G�7z9�ͨ�m��=L�i��0��J�7^'�}u�Ҷ�&�A��ʽ��q&01w�	�}µ��^VM��vL�OV��p�HK�/�IA��f�ޞ�O@��h{6<���������-��õ$��ti����{�w۔�]�Tʆ���M#c�1;��k�4��� �������-�9���� �P�Y���F�L�A�K��ɺ��b�݇��Nh�GԨzT*�/�S���Pb�C	����s|䫢C^��� `�3e�:����|ÓN{��an�3��Ik�?1�������j��dRq��%m��:��������XM��}���
�K�^f�oX�d�ŅC�ɦ\�Z.������tY����C.�_!��J���W�����0E]Z���2zo�Y?g�/�,��D�Na!@���m��k�iѷr��ix}p;8�Q������(�����g�M��.��%޴00G놿Eƈ�	֞�
vU܀��'C
�
�[߿�,r���~G�W�\����Z�o�	�V#9�)�E�OGd��y�P| �{Ӿ�a�F���AF���%�?�3BFh%���'�U~P7�����08BȊ����[�{T*5d�|���/�ƣ�w�棕����~XY&�������E;Y���tL�2��ܲ��`����>��k��4�q�9b8��|qD
��&?׻�[���wS���2��*���M��c3c�Y�U�;w%\�X:�Q��XR���~�3!�F|�M΂�����;}|JjLw�T�u���L���CXa������������u�TX�j�d�Y��S�R)�M�#����C_`e������*�z~��(l��8�{��g��+�@<�~����;O�v��+@��lho�RDUe�6����BOF�X}�g���T�ѣ�>p���+���V��*a��6��	ۢW��~��ho�/#�T4�B>kx��f9��3��U"x3ܢͫ0td�?�D�7��t��0��}�C߫Sl�����A�tq��5V(/M�`ș�1Wv#$HLUxì��~V�є�����TRZk*�u*� {�J��W�7m�%Snm���0��* �\:�'iCV?2��������"��o#6�z�t�g(a�}���7kK���-��J|+7Q^Rɮ)cmפּ��_��z���3%�S6ݤ���޻RBk
B��,w/�S�w��O	�汘7D��(q����\=�nO8��R�x��lIq�;���� z�Y�}���R�е�x�.U5꫽7�gDn)c��x;eUq�O�c6�o$������B�M�����)�|E�\�.~��T |��U��T=e���<�3ه�T�1�5��#��*ڧ��,���R�K��Y��Y�~�+����-�����_��T�����m0�!̌��X-���,��tD�Q/����S��0��p��qg���Y�o�L!%b�]R�g
�Y��XGL�;h�HC��-�%[����Cnљ���,�qC���HD�0��w�dG�mMf׆D���"�?z���JM�tڌ&��y�a�L��qc���lQ� ���l�C�G��X�g������ �JI��Ovh.�2�Vr���t��C��b6�¢�N���Y}���[X����9"��)�A�5���ybF�/s�'��W��Ū�SZX�7�8���h��[[�Gh��>YYƷ�E�	T?�@s�DC�]�9��z��}���헗7袼�!L붞Ő����S���:�|4	L�����L���Xn��V	r���)���7����!��tPjae1�q�����\Ī;��bv|�Y]KZ�A<��OmV��N�J=4m1T����Jw;G���A�a����}�7b��ǆ��aS�U{�ߪi�\��f�����x$��p��~����gՒY��h|@�9�e�(�Ѣ1��)N���"�M��L/)#ע3Ȉ.R��[�GjA ��$v̯�ې��s���Z�ު,5+�8)��p�A	)ޖ�;x�����=����Д?(�W�ʦ�R�����o�¦*\k0ư��[��&�__/�y��o]�������p���oȼ&���VS�`�����T�ٵ�&�%�}=�a9��1�"�s�gʘ�G�8{�".Ys�Xj�xQ�3��T��Y��#2��>R�Ϳ�p1k�q���D���aqee��,�D4$��נ"C����ZD.��CC�g�9�W[S�7�kU�y�[G/*�����gG@��Wg��|xЕ�I���-I[W�Mч�uT���gˬ�'��dI��eN�b)pm�ލ�g$��fzV�4�vI�
}M�s���P�k5O�J|��t��Gl�4,a��om��I"��TV��툫*ͺT���F�آ���bT;��Tf(��#�_�ڧ���_�����?�,]��;TW�b�!}��X�a_ѧ\Yޢ1kY�"�f�Qcő6ڳE�ގ`c�����sl32��@|`�,�x�':"g�7�񜇧P��@�����&=q�j����I#�3V���9��pQ�L�G����:��!�×G�h*���KY��D��ZV2(adP�5�Trg�LUV�:����lK�p�fL�~�߲ۯ:,��q�S�9�EEZ�k�އ���H��All�V1�De��~�Ɓm�r,�朩�nʖ!���]MIK�^��"�D���}W��t5��h6!T��Pg5���q��f#��TUd����'8X]NuӪ:�����QV��5%ߡ ��Q�WO�2����'    m�G�o���XN�&�8��TAkLZ|�a�gp��ܿN��%���<?���� ���>����yæ�^� -��D\�U6܈��,jv����(1�0I����ס^� 1_6�5�񻁢2aBB��*@.�R����PF���b��b��~xY��$��$�t���/!�i�L��A{�2oë%1,����A���p����d8����B��xK0����DH��l/�OT�I�?d�BHI��2WH�>�N�n��=�7"��?xL}���;��![Ǘa�$ �~x�޸x$�E�i��Sq���av��J�R��+w����N�ﳝQ��f���29�,�= Ct�j~.D�.!7��G}��@��Ī�[]]���T5m��U�Dj�fG������T�N�X�mD�2էk�FD�KΓ�Li���CY8?�Fr����b�W������F�7pkL����goט������&�]��m%g������ZSI>�)N׍ ��3�RÉ8��j��p�O�Ógd	�UE%��Q�w�9:��Q��Gn��%�X?�;	V���'�����1�Z*�1�B��nx~���"]��bO]�>C�4?	Eǲ	ͪ���g��������'9S��	m~r�o�	F�����to��g�ب�x�, PNY_g<b��"��Ph��M�[9�p�����,���,�<��҃Gm�*)���	 ��گ��<��U��^x������k��9���a�̂x{����bԼ��9���o���;����`+,M.��S�K�
V��gu�n�X�*}Tw�z&��i��;x�����߲l�5�V��66�ZB�UE��բyhPhf��_(a�� ��C������Ut��"�5��Q�y�wF�����%�P�=��/��X�`wY����H)�[�? �,k�U $á=,�[z�
�Y����v>�tf�)���� �e"�N2���v��D��'�7@V��w�JP��A�;Y�UA����tFp��lן�ur^�|i���>Օ��P@��#i����5�M\@�/�S�����b���BG�.7\��PZ�ͯ"DeQw���<��V��oV
k�oUp�L�|?MYZC%^"m,�Ծʖ/Wn���J���ظ�D��z	!S۳US������2v8,�iiO�%�7Ɓ�b��ôJB&��Gu&9xy��SuJ�D�s��1��,2I�]�vjE�b�$�RMi!�ll0�.~�l`X��a�����Y��s|�ܣ���5�,�Q6.`l!]��T�:�
]��i¬�B�\����"����������������>&Dy0z1�����hF3*3�b۱�M��|��H��S}�T4�W �p�,�֮�/~�F���z����)M��<����y4DD����Հ�7��	L��y�y�����q�d��҈v�:��\�n�l���pܷ����
�W�<��R�z$�|�D�ɴ�'c) ���V��~|"�����Y2��g�QV/�\�,�P�Fƍ����@x��Eo���$����6�CgWA2�j$��ktB;?n�A�Q~j9U���������,���%�A���6`5��5ϩ�g@z6L#��J�W��YftBYKM2���xĳ;򗊘�uPO�#1p��UF:�z�j�h��.s����gԙ�k�aZK���Eߒ�2� 4�J;)��^���S
�l�&�FP����
��7�J��.�HLΒZê�2�d��	G�Q��'�G1#U$�?�����2����Z�h)Í*Gm�D;8<��F�D��M:~"5	�J�<*����>����'P��&� �	PQw�ku�F���|#�)ח�W~��2'�me/.�h�A\�����U��D_����U��V$�o8u׫����L�j�L)_�Tn��tQ��0��U;m+� W�a��wF��N���fO��I��x��Іv�o��~+����J�w��,�w2���R9��v�L����J�G�]�'H�uS/�al4]�ʋ�7R�#�h���9$�>,5���tZ�n.��J��o�P����@g�R�0��2p��N�e=�-J��^��#m߈�TRf�3�1S�ZΠɗ�YF�`6վ����V�H��fH2o�E���r�j�" =�T�L�f8O������;�!�o&��ĺ!z�����W��7xiƛ�0?s��� ��%M�U�o,Xg��r�G��ZE����g�s<	d�R��MQ{�%�+�R�~��yv�!B�[����z�	"WI=��}F���B^�FU��l���(�Lj+L�=�h����u5����U�I�>��"+�0Ҹ��@���N��t=�~i��Q��b�W��'�Et3�^#j��0�����M#����)�U��_,�ch�_dY�dU�c��}P�`�p��|M��H[͞UѦf�X\��Ƹ���V8,�N�F4��x܁�P�uwK��Q��'�>�ܡ*�t �㯪��;�3��3
�r̥ె�ҞlSB�!p8*ײj�Gm�z�.%`��	O�b:*[P@\��N-%m�ad�0u���������{�!f��� �;a'`[��ա���^�:�GxJX��BS�v�p@<�I�YX��V���T6br����Neı�<�:�L4{:"���ܢ�w�����J53IOո R�͜��z*�+�_�.�yr�%�:�ֈq�׍8�f��F늳�6q�g�7��Ct��j�)�=�bf��U���1���4d�`�4�{�GH�+��C���D&������<�~il�oZ�f��dj���B3o�.�r�YX�9�CGd��I3^4+�3)ْ�r^l��R�Cx;�,j��nH�/A��PX}����5]��Aa�#�W�����]x�}���<]�o �Q��R�aQES�q�� Q�,@��C$����Ej�0��l4��#&�iO>u��Йw֊Y]xܧ���Z0��~ջ�?���Ui���GO�*4�N�k<������9��'�rhj��G ��![D�	
�ʢ���!��n�+A��T2{���[�8��R#F��:'��9�Z�gG ��/���	��J؄ͩt��D��j5K�ک��#<"
�J��3�A��m|�:zQ���W�����q�:�b��}�ی�H������:�} s:"��������$A\����@��ތ�z`vD=u�V|�4���>�����Pw�6��Tϛg�	�@@X��Q��h �N0(d�:���P	k�!.�Ac���q� A�Z�{%�X̍z�h&+��~W���<�8�FH͡v���nmwڕ��N��Ћs'�V�qГ�uӏ��bSaߺ��(�M5 {߅�nk<��y�:��2�mD�I�o8 D�J�U*�j�y�l)�}n�ſ�^Bz�-e�9(����,׌��)�?���8P��4�N,�M���G1���ԁ�o�Wq��DBx������H>@��7>�f�ڳ�P����͘�c߰[�_Vq�Z|�)}P�+��ar���K� �!8&�J�vpޜ�ok�[���Rg���8n���x���lg2����Um>�*x:^xtH:a�/�'W�9]fGX��2=�b��1�!
�����k�6Ӽ��4���a�!U��F0���ުk1��R3��M�b�34&5�:�V�T�w�wP��u��m�'xJ�Nj�����5����٨�����b?qя�A#D	���&��fG���sHDS(Ѿ�j��mث7���l�^��<k�4Tؑ*@W��8�tP��^HE�x~ qGeHw:�i����i4�#������u������i���y(@sjL�UnB��"�M�s؛�!���8�~#Ԅ�C�/���r5�4`�s�h�ʃ�▜iT���8���15����m�=� ����mD$����١�yS��+��h½,�B�ᗐ�&�#�N���>C`)�"��!O��\��'�����F�K��Mp[�+A]�.    o6*y5o��M����&��5��?����&�Z���{.@9� ;��4[�U��]�}��:��O'��\z�*�ƥ��A|$�J�f%gd٫�{`.ל�@���OnYt/�F�D�W����R��j��@1\T-���OIR��B
a���.���M3GPR¼��+�a1:3I(�9�"fż'c��X�>��t�9];�V��ς�	4���H��bN�8��[_ďfQ�M&�&��ت�+J���r���,�\:&v@��o"�����,?^��5��1O`��$agB�ل� @Mݱh)9T�=.�d����:���N�o�P���jz<-i��U�l�5���RZ���
�xPRQ�?SK�-99A�ypvx���~������uzQh���@�mC_`3�[�o��#��(+;k�	��b�,e9.�׶G��?�N�~H� U%�xو'�����2y55�FQh��Ca��\�y��M"Y�"fGhYEq07��y�M)�z�!�u۪z�1���.2Ku1I�b��RI��TQ5X!d�� �{��B��%	�3��K�}����R[.����7�2��I}L8]y9�t�����<��D�0D�+�m����٪�AϨ,%Ī^|�
X:q˯;�*��A-�C@6{�H<4���!��x�y����:!��7Y������~�c����{[a�;��0�+Ap�Le�Gi�عQb�\��e�.���$ӡ�t��a>=��c����������2�K�g�7����h�w3����B�3]L{DB����xݏ~��΍�^C�N�H�� :{�'GtX�L/�ؿ~�M�	�y�R�&�3⍹p�tĻ<F�b8��x��O���Ҙ�e�ɡ�SU5Մ����'+�K�_I�Jpڸ�l_r0h�4�[��tˬ��W��c�{L���0�!�(1�a��Y�a!1M6���z�x��'u�:-e��D$�'��M~�	�|�]����6��	�L�$��U��?�M*��@ 1ߖf�R��b��"zX�K�O�\�'[��B��q��:�/���qV#L�4GZ�?]�F�	��d'��V��4���B��T(�I|��L��)�T3��N��7���	���L��'8O�,��R�c�e�l}��Pt��Td�L֦�����4�)ɏ,Ҹ@�r�`�`�R��@������j�z�<7Ыs�ާ�yY�LD7Q!Y��H��0� �$��#��w��͔�a�l=;љ`�,�����ohR�G��`�� �M\_�lX��%��<�Pu*O��R��i�s�x���Z���ʹ��l��t��1��j�AV�m9ʚgȷ�?��3�ٝ�$jp�[=cS廐�o���dD�P� �QA����r�QEx@3����_f�e�o}1�`�:~i葒^�8�ڎ���Qma�6���N&��ۺ����5�ʐ2S�N�� ��4���+��T9�x[ip;��(����gHt?���]����Z�=����N��� r�:��}i���L,�?�_�FcJ��� O�2ZS���I'��M~&���,1|y,L�^��M ���I:HM@\��NV^4"��~�a�6{���1
맚qM8N�W��ɧ_�n�Y&�r��;���,!l���םyvl�t�A'��`P1�l� ��A��Bp��<n�$h��^ Tl�1mڳ�m"�d��E;�h��zV�L�2ѵ��KW�Il`D��t��:�#�o�*�������V}�.��p��U��p��h����������"[7��:�kN} cOE�@�R�`Y5���P���2�k�����qo��9���@�3վַ������
{҂&��	����=MF�d��3�x�p"H,���X�K-��W��H�i�>O���>�H�9���4c�� �o�t�a�(����Q�F��fjME;{1e݋��7�'Q<	�F?H�{�}̀��k_��z!�*"M��y����o�����E�F�m�tz{7�Ej��B*f(�Z�կת�����!AA��i6��h���M��:?����o������Q�uC���s=��I��X`j&����S��|��k�!M\ �[7�.d�d<��s�n4	�6�˛�`_S­�^A*�&{ܓ���+�2�b�8�{@���mA�ńJ.��9S+�G̨��h�s�#�],�R}�eG �OUkN;=g̑����'�@,�-Z���%��`r��|���+��1��B�*m�X�wݞe:��!�T�q�^&s�[��&�����_�T$���
"�yµ�	D$\�-�B1*u��>�؄�L�gp�P���_٥����XP��7CEN�tT1����W���	��*���@W�Z.<��[��g��R�\,^hx�,�_�xp�ưUЄ�k����J+�Y��yӂ}��lk�U�������A�5*�8��Ǽ6՚C
�ѧJQ�>�
?�p�ن]#A���qc��釸�iB�N v�������U�2�{n�1�x�+�|:j�6��i�D�	ٹB��B@MZ�����9��^S5�#�1CB�8���	�Ո�w��<�
��+�C��i%�Ar��r��xBKI<tߩֶ�Ce\	���'R�#���T'Q���=_/D�t�.8v*�@6Eє�n;Ŋ��2��r}_x���CW�ȪXB�~h�ym��@�]�S����� yc{u;�Mb:{ە'�eJҰ��(���9��.�f�I�N>���$�JSD�<�\o?��&�3t52��+�~�yb6�H����9H��`
�$c!O�B�"%���f����@f�"��T?��`к�k�<},�LT�1�׹"�5U3\%�@�.v����k]�P���A�ZJ_Ag^I._:_ ��x�����r�=�[�!��Wm`A$�ܫEA�[p8��Jo1a���üА���Q�)���!�Zꭱ��[���5r��_�� B��dѻl;�τ�"�T
�e#�aD��G�����S��+�}��%�g��b�����q�	s��R���4�$K�ó�����\#�N^տ��x­2X%��U��$EhX3��f������掞�'4e��F�H7�=`��E�޸�� hc�fD�bEޘ'1�ߥ�����'���}���aK8;�$M��ӥ���S�gr���-&0v줉�'�m�Mb)��9 n_Z�J2�^w֑*W��jcT�`�L"v	DK��������l�0�xuNWB|{e��~0�����s�!�m��N����K�{�,�D�r�D%h�i�Q+�#m(�����C�ө듪���d�T��/ �m���6m8*d��Id�־�ᝄ��5��DE0y�С�(���VA��u�1"6���g|����Г�Wᅘ����MvV�ړC�.���@-����l�Q�fipU��aUw|�H46e���6&X�)�C2���(SW�.4�����*	��U�d8��Uz�9� �O�����ч���4�W��D�
��ߜ�a��p�]A���7��3�B�n �e{"��ĮqN����ƺ}�5��$���("����hJt37wJ���:��lzèu��S�=e�k:XE-9�@���vx�8]���dj��Vo��oU��}�@K�I�q��@+��T9�3sB��±�7�@��8���l���-��wi�@�W����)o��2�\>m�P���elb)�s���U��v��ԛ�r�����O�kB��P��w#��^�\VL�g��:\B���"O �}V=pr|#v�QuQ��B�<�LYrM�\�n`�
�]�u��Z")�T`e�뜴���?��Z���mƿ�sK��b��c���
�������%��� X�L�Dľ�i!���������pjR�@R�R�JkϺ�:�R��� ��Y*Ku&U���o\����R���J�j%�"��M$#[w�����AHF�6)�^�܋�deh�a����x�Z֦/X���~s� �q$����HGS;�be�+o    ���a�u����#��älɞ�g�-��>.׹��3�=U��Cy��3h�3[�r�}���{Ǵ�t���g���`a���I����N��|�(q��<w p�Z�{!&$��yɄ�2Χ��yQY=�T�o��ߵ�b	�Z�g�jih��J<G�6�����^������$%�k&8��$X{"A�u���6]"�^�@ ��uCB��#DR v�:\�DB�FB�w}r�	����h�h�R}�Q��8��JK�i�4�l�Vo=��f׺��â�H�z	4�3!�v����<�e~�P�&����F����n�q$Yr�Ҏ�[�dռC%z��3䡲���4m���}&xqsBE���3�Vtv@H�c;��0`W3�"lI]�@�,<A÷�ɮ;�5.O�2�%����D���и�h_���*o���Dp��g0;�O�V�F���Y9�]��6w��J;��.G�1v>'�̓�(=�Q��c��#�_N�C���	�(���M��Q�{��9ǜK�f���j���R��_�~��t���Xʯ�D�S��9�����Đ���Y�#n���=����IE+������/������U�����tZ5'�v���r@k�};S��&1C���kxV�4\m��6�@����K���I�Gxn��X��jŝ���Ϲ�@t��K�т���p�T�[,����w�Q�T��KJ'���e'���3��ǖѦ��n^���hr�~ա1�>
l���r,rQ ��s���,@x��&�c:*݈H�C��:�H#���
�.�:���=�M������:~�v���\Hn�"��:$�w����&v���d���������΋���f׆�� K5�c�n�6���a�5|�â�q�~Y���f�Ev^@l5M���Tl��,���$ H8T�;�-\��d��5�0��LǺq�r��0��8���E91@�)�X�	���Q�v�Y�B}s<�MT�
s�h�/m�K��j���}F��[�L�k�c�i���k��a�k.?z#xCG�ZU�˯w/a�M#��-��fc�"M؉@�g�>c(��"-�>�Z�ċ���Ƹ�A��)6adC�&*�I��wVkWS��Dt ϫ�֡{�`&D }o1�Q��50��.�u-8�4������@�g�U���V��\�E�$���F
$�	����P�vq e�i�=ب�h�'i�T'֪D+#V�<��J��Xc]����Y��mۤ��d|P4��������4Ex�..�K1�͛��%M�ιB?�Zd���>o�?��TqK"s��i�o��x~���B������q��d��g��\ �)%�xl�n"{'�}�tN�Iē�e�v]{4Dc`f��f�>�������*���I2�rg�`ß��`hA F:j��)ڭL(ݼ.D�j�J�,�:�ɟͳg��Z�|R��7a#�C����eƙ�Q��l����D����ܦg����-P<����6Yl3��\����j�%&���^�3�X��i�h��p������~&B����E��5a�Q�w�����$A�"E�q��׏�w��\]g��MWN�MekgR[z� +k��eXQ����)�g��p^�1�w��� 4�G0�C��n~�'j�j�N��>~�����S#��Y�A��kr�-\%-a{�DJsv���-���/�I�]�>5��҈sX�[è�	|�N����m� ~Q���;[6]�s���/ \̹'��D�@�l\��7i�43wJ�9�2y1ɴ4�sT"Z�Y��*fX��P�1#���Y��֏��ز�r}ge�u�ԓ��v/2���~*vZ����A��f�L��S�ѯ9r&��X��sƄc
�M��E0M�(��f��N�w ��_������~#��%� ��zU���/������`Ӡ]�D:���P�����e���<��sy"P�D�1��)�>F��772��iɪֳ�A?�^xB�Գ۴���:� �ˍ�P�b,N��zߙ?Ӥ��mC9!�3כÌiZ6vdI�Vy�T��drD1�_���K���	鱮T��n�1�b%�T���\�ȯ���-�X�J'ު���B��*9fr�m��Pyܼ���wI��	���[f��7���J��%O �Ӱ���J��>���qv��m�j�s��L�%�^�� ~w�$�{t�L�x��� \������|_3i�/,�+��ڍqO &����n8cz­���(�f!����@?��5�R�)�ޱ�2��ʞT���L�F��
Q�*�@nI�i�~���R�M���%ꗺ�\+L��8
I�P�8� �U��Ws³�@š��J�p�-�S��׫�X	�&b��`��+��lE�R��e۲l��q��g���bT��9P��.�S�m�Z�y������@eDaR��<�Kb��)6�]lϕ�����f�qO���uv��#A�ϲ���H|J{s��	��'��[���p���`N��4XٮE+g���;���j��f�ߏF�DY������o����Ί�Y7OPH��]�t˫l���z��|���w�������b�rpʼ=�%��6~*r���� ��8$)��� ]�z��D��Ó]Y�l+��2)��P �
$~�v��{����}j��E�7$����`.�L���C�l�:�`F����D�η�(F�%��,�҇���s:_��]�#b�hBݸ�͏�E�^@���)��"��6"8������BS��\���'�i<p��R� "�b�V稩�ݚVF�3�������05�a"4�b�}����ʯY�I@�u��P��߼��KH���zD��?��C��'�P���r`�&�$ro=w���'z��F��6��{ִ��S�rZ���f#Fo@�ރ�i���7]@�VR3�|�.FOH�B�?�&�3߷}��#��b����z�
�T(�P�G>����Մ�5Ϳ���;���� ogd�kk�FˏP�����;�-hѮs/��m��]bF���X�'���+E�'���S!��(�3Y�c�AK\5	�W��C sU��'_���S�xA��"_��K`Iw�,#q�C܉�K~��p�2h)�	Z&�Y�:m�zꝝ� ��ΑMp3����7H;~)Z 揳.A�Qb��K��{
�bG�X��Hc>:8!1\�K�,�R�E��'��<�.�֏,�`n��/!�3>�qVn�vV�$�$
5�	��L�*�����/)E�QE;���j-��q�6OV����2�	��h�[p,���j ��t�@�0�g"�*2��Ԅ�פ���׃�"X��(_dы�T&��gF������'�e�v�k��E�B7��}sދ���Qd�$�E,�e�Elh� :~$ڜZ�3�;�Z��~�ȏ�1V*��C�6��0TyM,ݖ�*|U�'�sSW0�]�+)��Y9�`?R�`�l�J�%��[tD ��~��hQ�AN�a�'4м9rN����~��)G^�|c��9�kIh�b
^�K�+�	1�fRy��gʁcܮ��Ӗ�wb�eY�2Mܷ�$�X۱�!uꟶ�C;`���y����7n�(3��G�\��G<��ӂ�zOR������ R���9�؉�4�q&���zR�Q�Uq'j?���Ռ��Η�LZ��sV��fe����J\,;����9�;��{n�`}L������G�S�����T\@��nc�3�|͞o�]�A���y���h�B1/e��c5wb<v���h�x�x-�}��+��#�]����U/ʕ7 g�z��+5E�an�^�k䚹@EE�ac��F�ip\և�Qu���n�C,!���VR����I�3�@NK��d�cV�y�E������#FH�?�q�߱k[�B�L�
%B���Dz(��������M4���o�	��Z-
��(-j`����k(���d���C�cx�KtH���,��a1Pҷ���>%Zv��P8 �  �Z��<�l��WRR�F��ޛJ[���9,��N`��䁄2��]�U�<�����U3�s��8]�e�ܒc����2��)�R�p�Mx���g/ÝNq���� �L��<TW�!7�\c%�㛍qn�7�:�4XN���@&*J�qd��iң'����?��1��WS+#�1�g�v.l��B��<ֱpu�:!:%vKT��͸��ϺL���� ���[�C�h������Oՠ3љle����c��\��K�b=���z/B4x�̀.��)����¤~t8�[�9�!�K%�y�U&)�?ձ໭* 4�%R����6AҮv/�uQ��$2h!��G���Y!���N�8_��x�����	�T��b��i<^�oz�i�=v"��7l�P
�`�b��˨+�`��B��nG/<�}�"�*�}��T'��a�X�0 'RZl�̺]
��h���6�Pl42b���7Xť��'2¸@�sk�z�X��e���j)��(���e�$g�7�
�H�1�(��[0�D2S�����I8��/\�qQ��ք������=u8��J��ձ�����B|�kF~0R�:�vO;uD��3���=9��a�y0T��e�	�����]�f�8����X�SFM�X���i��I�����b�أPjL�w쭥LY0�8�}���i���'">g�`��^�~VT1�U2D�C�r���~�صD��s��1�)*����JݑS�s$����1I.�i�����,
�.�J�_�w����uJ}?��O�8<�|W�=kQE��T�1����iF/D�UH:�Ĵ�Xq����\9�>!���VXE=&PaZ�1�ܑ�NO�J]��*{ͻ1~�E�0�{�7hH��Y�xA���%�;����-u�����P�/;�E��=h]'+�+���,�i�/�Q�#��Ŵ �A�'U�(��'�Kg�H�ʄ#%�QIi�a{3�>~�g����=�:�S�;|�"�㒤G+��3�_G��i����E>KI����h���n��u����Wш�[<�̖͊LO��G�Sd+i�I0I��䦢۠y�9H&ߴL\��B���9g��{pr�,�`��gm�I-z~21Kg�G�PEc�̔+�4B�\f�3qˣj��T�n'�%j�,..H���:�ڐs��±|�=;�΍X���0�V�уlы�A���C�'��+�U���g�d)Cj��V�pa����M�t���a��o0M��y�F�0�.ku���
=�|,�ysw.�Ј���)�촎:1��P��
g�r�S4T���S�ҘSt�\�c%�c��%�T[p|�� 8ޮ��3������'��qs��a�����0��n��D&{����G�w!��[T�����_�H&�c��[`N���w��U������CW�������¥!b�I`P+�H5��0�eE�$�0���C^�Vr�~�ڄ;
��c1a�;Ԥ#�6��v�4�؋*�#���x� ̧T58������6�֮�`�M$M̴�C�9w�=�m�X�6�[��-,��r�R�s�Q���u���~��(]��@MIg�{�D�F�>�䎛u)a�Ɠ������QΗ�CI;���ʕfpM�.P#�=��IBޕ��e ���*���y����Θ�"�9fe,�Z�?��C$ӎS'�{�/qO��Yj�.R��0�q'�p�:�;j}n�|U�}�~���;�}��w�K�,����+����(�>AQrF��`ӑ/㬵���r�Nq} l� �x<���1C������GS;���-���"�Z ���@̉���U
����G<�ĈD 0f�/@���vK�D�%��Dt�R�5�<�)��z�	Qr�d/y���h�ԋ�� ���hס�$� U[�<�!�����4�7~s�Ң��~�4�I�X ������qS�      v   /   x�3�H-*(-�K,�2��J�N,*IT��U��L*J,������ ���      ~   �	  x�-�[��(C����	d.w��hi�~�8	�oYf��o���~5���s~�Y��p>����<}~�x���Y��ϟ�7�q�s/��/u��;C����o?cN���Ӳ�::k������>��cn-����k/���c����_����'V޼��Z�Z~ZWB�B�bX�ڰl�,����F�^T��k�O�Q�0Lb䭉��N(�~~�k{iY�|?��]��ݨ�Hd��me�{�򇖷�����3�h�kǡm�=����H8B��gohm����m�������W����!DN
��qf���@����Tg�"5����J;��SΡ�/���D�-�-��~�����z�=�u��ֿ$�-�x��jG[�>��;��o�X�m+�:|��wJ�3^���̫�����=�$<��>$�\��.�T�ӄX_�����8�"%A�?6R�{�Ű�L=ٶ�Z�z푛R8���S�T._̔9�y��q�}m[��*��s-�ڵ��L}Xk|�Y�G�J��
Sd�m�,�J��h����t���,�C�m����`|T����6�'Q,j�A��T5����4y���T���(�w�>�{-y>��j��-g���/��:���o�`7��'��\��;�I\��4��؀:а0 G�_N�,HFN�����҅����Q���S��$o%��3t.<�rn�&a�O�Ј���Z�����8����oIv �B�'h��~�����ag���ǖ۸�&
�A�%�R]�J��3�#zр�j��ڢ� ���<O�gN���$�I��@��Q��)�r	��Ԋ^<��&UV�Q�&ʂR�I`�^�D;/,\�(׼����L����z�#��b��\��\�H?>��O�x�Qu�W�y���k.��VJ3��,`r�a�#Tf��y�<(.�D��pa���)��|,��c�x�Z����{^��������Ka9����.
�u�{R7�F��׶�?,v�ʚ��W�����5r/� �R�`�r�;^��5���X��,��t�h킝=@f�Q�wG�H�z�Z�ǎ~ ������=ac�]6Y����_�%��C��[�0(Â--Z��ث�:f�׆��-���n����Z��Q�T�dM!�1��1�캨t��(ɕ���/���8� ���R_����)G���KV�Ӈ��''���\���U��/���.g�4�E�ʨџ
F�Rگ!c���o
!Ř�Ɇ߱@.��=��J���)���?�]�(x�=���)�p���)J(�9�Ew��kn��TK� �N�l��p5�l]7X��U ��Z{�]-�3inE�!;��7dF��T� l���1p,������	���n`�Vb�V2T�[t�qi��L��j�K���-h�i]"h�6�U�1Y����@͡|+L�!0-�͙�
�d���e�w��V6�Q熈 �uH�Э��[3V]$�8(ן��e���Ɲnv����n�~Cr1-@�1�' -À��0��M^f��g+���P�N�zҎ��?�e7V��1�V�W�L˥��]��!������+3�C
�ep��U.G�3�y-@�¼��#��a
v)�Tz9�:h�;Rt���XZ}�w[��љ����Z	���2��8�L����1/ϱ{2b�Ψ:/��%ü*#��^V����m���n)T�9��e������BpN�|�~9r=��ӴDpt�B��Y}�tT4qv	x~�����ºt����^I��`��Cڦ�Ll�	���"�/k<��H8WL�k�v�ҵ��P����#3zH��@�3����Z��r�w�.g���b��7��,Jc�e���!�?�l?�נ�C+��/&<�s����'`I���i���^�=�gA�n����c`eT������-"yC��
��@�R�Qt�ޡ[Nf���^օss;Aj%`W�bh��Dn��b�����q:t+CI?q�vW��G���mG�ˍ�7#�p��GH��
JAQuF�vc�����mM�|�ߒ< kkOڣ�/��I��8�m�ýL�}�7G�M �0��DC�����	��y�Ҩ����q�� �`�~A��F6�W���4$�_F1.�Ҩ��`���4®\*1�7��m���� Xe��(���"�̆'t�5cr��K�~M����p��u\�-��A0�ގT��������wa��{�Ì��(��8�r���4M���(k�G�Ua�n�!`塮��Ƅ�
:̡ӏ7#�aŝ�A���E��{)�~s���l7�~S]�DQ����j0̜F��A1�A�PnI�� ��F��x	cP��e�� ��c\J��?;��5छ+���	�=�ʛ�KҀ�\o������oA	�B�> ɔ2����Xs�UF;s��«��,� ��v�$�:{M�tEXX�3��O�]������*�f�      t   �  x�uW�r�6}�O]flG���I��$�Rˉ'��@$$aL*H�Q��$A-Ng<c�.�r�=W��f#�D��T�s�_*ꓙ\k�~a�|�T�04 B-�؃UEC�O��U-s�Q�4"�<a�|��[#qo�IErm�*�D���=4�RV+��4%5��ME3�(K�j�Do��G��kv��JP�#��F���n������7�L
�S�*U͗8:ǩ�Q�\�Z�Qx1�?���z�.y)ܕ��=������52��W[�ȅ~��6��
���y����78�e6f��,#�78ʍA�a�X�{��\��R�rxX�G�i%س�(į\X,�`�����O���BeL����V�Oɸ6���ȵѼx���}�lM��(������<���|Vz��AD&���`����<H���M����ABn�AY�é�t�k\��q.h8"S���媦�7�|mt�a�}�V(�+W�����y�V��5a�;B�Ȃp�ao���'�EONg(!3ݘ\tlӾ �A��J�y�&G�h4"���ky}��#$��0r�A[���f�[P�(: ���������4��Ek�&���k��F	y����� �{��r�xJz��=��F�!Ol����xdkAc�\�ܜ��i�6'�{�����EԎ܁�I�,�4v��W�ƑK�KJ�F�T�߂T���	 �׼bw�� �8="���GlOJ?8�Gnd˩g�&�~c�X��*�������v+
b��F���4�Ȭ>c�*z�֟w�����߆���F��T'���9d��~m��F��q/��u�'Eց�[��J�i���4<pk�-@�o�Am��YRD��ƝMr	������ ��q��x�Y�ȕ6��8�9Wv푋����Լ
%KA3�ܡ�"�Y@�����rY�gl�,�-c�<��3r�_��gHY�{#����"m���܉7W����Cg@�?��6Y��+�쓨����Ȫ��S^ïS`��8�Ŋ��H@'\��G��-��`�Cvp�>�:�Tbq�"4am�+#�%�
�D1%Ҫh��
�Q�BU�4p�٦��C5�fm���ǋ��:�������t�b��T�7h�r1��uͼG���#
6>c�2x�{����>��%ߦ�@M�d�-,}r�(.�e�y%뭋�d}��������ie��J@5��3����A;?�D�ɯi�.�g)�i[��	�5���CW���
�K0xlj��y�=x*�v;���>�h�t<�3o�7��=��e�k,br���P�Ə:�+�M���������� ?pc���d�X	]�޹���@h�vx���.�f�R��f�r�HB�7���ge��as�j/r��N�|>o*L 6�ȩ�yz\�Ր��tzyǦ�K<Z����n�����E���k
v�}K1���AT=�������9��þ��XJ.� �UvԮ�G���������`���SM����M@���O����W@z;"�CL��ޘ��ᙗ/�|�aj�sp��������k�ƌc��l�s;b���c�Ӈ�� �������-���)�E�7Ɗ7�-�;�K>f��c�M�|�5�?���I�ӏ�a�e�IG�SG����?)�V      �   �
  x�5�Y�0��0)��}����n�Te��-�ZF#��?��ε�~�������\�w�{^_���ӺZo׼��^c_��Ɲ��s�{_}=�ȏ�jm�d�-_N$E��Z\�m����jQ��q��u���G��k��w���ݢ1?��/2��&"�u�b֝3Dƛ�=b#����{��٣>����;�+��'�k+�|.��h���s���쎴:�أ�\#�=�WV��Cd<���X�)ƈ3Ƶ;����c��*����<~����e���Q�)8_��{�e����VE(*Z<�Yb0q�=�=xbF�SNI,{���o�s��KDc!�n�=�cFĤ<����c�G�����&�</�y�?��ba"�r�84�G�C7���y�q��O��9]�[���g����q}���,��#������x1�K�Q�,A��_T��O��Οy㴸ٌ����Β4q��Xװ�ź����]��݉wO�
,~�1'ɓ%Ǻ ����4�?�=�ɋ���[��N�$��}'�Z"�qr��\M#4��� � �Q#2��Bl��
	��CRu~ϒ(l:(kb%�QN�r5������8❎�Mh̛�%�^�6��� {�ܨ���=nJ��ӂt�ɸ�M^���1�A��hK�m�!qQԗ��h�I	H��2hQG�7�%�c�7��Q�_^�5ͧ6GyB1>����R�U?4��;��[ⴭ�@�:�����:�Dy:��6h�*���=�&^��2v����D�d|��h��O��[`��2��(���� ��K1���*��Z�M�y��E�|����H�7ϽZ��&3�0��$�e�M��2�/d��u`+���7~�S8Er|O���Z�[K�QZn!�M�UCs�O��L�^]b����l����U��Qy%�ӓye1x�d?�/̓-S����3%�f�!��|YV�V06ń���Wo��]��I@3���i���~� 4�[��V �l!��B`��`�	�t@��q	15���MU�e獕߱k�z��6~Y��u��s���noR��-۴�� >�B����ML0����_�3A#S����nQ�s�#���-�E8� ���|s���ƢϢ�z����O��v@�$�_�ܝ��>$	ms��xth��A<�o_�G!×�B��XM?|@ߩ߷ �c�'a�YУO:�Ż]8u ��#�S o}��w.�,sU'c�KJ�#J�q\��K�o��-8�2/�R!:�+�Ic�� '��T�gVwA�㰈�ˮr�d��8�V"+�񌼤�q�Q[�|�� ;�=����4����0}���w��_�B�C*{K�G��&���`ڮB�0��*9;�$%�����
J��9X̢cNѷ��!�.�h�A�%�T<�<-
�[7%���ajpۅ�_b� ~�mC�[��Ǘy~Y�wp.���$�� ,{��]����AsX��িSOK
I_
��H��@ƶ)o��ǖa��9�&3�Z>V�WI�-?�#��'M�?�˟m?�T����!��I®�m�;��#Y���
�h���§|�"u���2���b��#l������5�/���x�͎�@a�É`{�;&�&/��j$�ǜ%Y׏~P�|ٞ6F�M��[NGL=��m�tyj*���p�x���Y;��CG��H3 �Da��������B�\�|@��S'&��m�����=G��v��������U]�V���q�z���a鯏B��Պ�0>�h��ӎ{��(�!�-l�q���%x��z0�1��F�����pAm�v��O�� '�{W�ĳ�O �~�4A�A;ZEwՐ��U��aOcD]R�^�e���3x(e�v�����5�b���(䏲p�5!���Z6M�e�'4#�ޔnt�������_Xߪ�@�״5�yޚ���"��KI���h��M�<�b6sc��� �1Q>�ig��q����DL�]�r;ݕ�1�@��7�9����y���|��r���V4��~��{�gT�d�oB�Kw�}��pB�d|u��>���澥;E9}�ퟣ�]Ӿ�K~�B��k��T�M�r���z(� ��o0�^ٕ�����n3qi=�����gyx������-�^�w��K�"�H�"�m	�85�8��T��)wd#���#�.I�Ӟy���g2d5Ǜ�ƹ!ݜ�:��D3�u0Y��L���ey{����ќ�e�����gc����u����u�{ �D���l3�*�~5[M�������I�s�V�,Ez�={u�Q/��]���ڬ1vf��?N��a�e���;#M0.Nq柽�H҄d&y�_����?��7p��u���$�O?0�o���xx=���G�?����l��v�	%���dң��mH�{�drCR�=\���)7S2!��1���ի'��knŘ��V��O�0 H��5/�dy+��?A�Ɔ���Ƈ��nԭ�ۦa�V�]h��"���K�un����	��M2��D���T1*(�H�>oy{�������zc��ʝU�w$&��Z]�MX]<=���
��8�V��t�l��\^��h9�˅&@����y�go��!���!�=��^��!����.t��#����])_�~N�3���+�hw������JY^7����Fh�E�j�#�<���PM���Q~�!��'4���ѡt��^��Z��	5�E��0�S2�ȣ�����W��L      x   Y
  x�uXے�6}���qm1���-������.��.o�ƒE�DJE�V�_��J3"����D��}�4{w��k��&�l0��/�66����[�+˟���E)��<7��X�c_���~�c)�!�_α���⟸�E��a�(�gs��5�8�cþNu��=�/J�D%�4�f�i�6vظ��V�-�!�۵��ֲ�B�°Ӳw�?Gl�h������^)XDe�S�e�cCK?��>�CG�-5X&|(�p�M�{��~�XM�M��X�_�ܩ
��g/�v�o��M����U�Lw�X��F�c��ލ�>�:��f�ڌW�W�^�6H'	�~��f�t�`��~\a���\�85s4"T��J+������j����؜���C���wk+�+�d�b}����i޳/o3���o�����x����s]��e�k>����k�+4/�fo�c���D�͑����^�A)r�(�a�-�!o�<�;n�Z�T���RղWu�V},?�;d ��K�8O��h���4�co�~��6�n��7lC���E�l�-��8�g��[�}�u��b�.pn��𲳥�""���s���W�LYϺ4q�7�X.��t���^��X~j�9��O4���i��ѱ8�־ۗ���St3�ݗá�t�Ũ��}\ST�qXZG����-��
��˒
����h�c�GNOۄ��c��J�
��_�oa����e&�G<�
���H�/��m|r&���m���-<*���[D�i= X��p��;��.BU8d�	� �B:��.�˾QG��Äo�P!Q*%��r�����7��C�e�p7�J��{������>û_�����l#;����)?��UR��7����<`�4SO���)�P���hւ~Xp��s�M�[Yp_�dv�6����uv�6v�Ii)H�A�	](�b��oD5��i{v��W8��͚�~�����6����L��ߔ��	���ʰ�r����:��D����H.�y�,��í��`0��P�����7e�D���2�����i�'�68���1�<�t	͔֧).SZߞ�
d�ĺ�ޏ�)���c�;v�&6/��r�+�,4g�A�p��֫<���t]���ѕ�jFdVx7�NuMb�6�o�$ 0%����Z�j�+?�2���>�SF�-�@&[Ge��B?`�T�(�k./j,���4����m<�
�S»	Μ.8��W�	rm`�j�1��d=P��m��4�����ڂ���H��x��:�!��ɜtA�Ӕ�j�>5�*^/�D�r˷4�%nYh_�DE�={�t7���ǂ��֊��d餃遽�<"��@8�;�%�a��(�����rE�5�z3�퐑��7-�'����!ZBfƫ�]��lcK+�-��3����y����,�q�d-8'U�7BFeQ��!$�~�!P��V>}:l�!_;Z���mI�v��_��]�lF_u�EsQ1D:�{��0ٲ�D\H ���hx�֢q��VЈ�[��[�\I������R���X��HtI��w{Hp���B�)|!������ެ��)��	���u�%��,,g�[@q���C3�\�4yx�����h�U��A1�Դ��g�ԎJ$\�  
+�o�D��=\�r���V
]e��VQ��剕�d�Cϗ9W�H$��jv�>���Fk�@㑆K7p�6��AnI���r�G�E�Le9�ֲߠ�k:X�lM��<!ߨ�r�WX��`�=޸��5*�4�e|�H�@FY�Da�����w�U��6�g�"�9BOq�3�c���G���3�S�e�؞��P��!�p�T���Ė�aB7An&�!XD�E�*�Us�O3?�\$�Z��-�DEE"mri#��J�4��mj*L��_�i�������,e�������PI�U᠞�*�s�m�@h�� P���fJ���݀zv����&<Lp!}C`,�rU�n�I�����]�h/x��\�S8�^7�g�Usy�x�C>�h�p�u���o���xd����!l=Jx��F=q�4�)�	�&�ҁ���&Kn�	8�Sx�~I#^H:i�%IC�i�1���^ ��
�ñ�d�^b&�<8� �k/*�o(<���0�T�ѭ�1�LW�|��.HJYz�T򊥰|�?�)��V��
Z^��T��]>�gZ����sҘ�;��?����G�4��g*SV�
'
o!��Q�=�t��@]�J��Rf;�6m�Y��݄�����
.Tܠ��2�q��6�.}�B�8z�ӥF�>��@(>U-M<��70r��4�w���[�h���ב]�y|��!ii��YE��[]lx�D����"�^��$>�6���Zu34Q_�������j���$/���&x�o����h�����R�R��Y����ܪ"��B�>\�Х�Ω rZ�����t�HEz�d;��W�xB�(�BV`9Ja�G`��r�:>\�3L&4)>2Q���S#DN�v���%�Do�o����R7����O6&x�h�>(�	Q�hdXj�;jrIԲ�Vw}Fϑ/�L]9������?��:W     
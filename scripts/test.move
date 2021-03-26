//! account: alice
//! account: bob
//! account: charlie
script {
    //use 0x1::Offer;
    use 0x1::Vector;

    use {{sender}}::Torch;
    use {{sender}}::Root;
    use {{sender}}::Folder;

    fun main(account: &signer) {
        let vec1 = Vector::empty<Torch::Tao>();
        Vector::push_back<Torch::Tao>(&mut vec1, Torch::new());
        Root::create<Folder::Tao<Torch::Tao>>(account, Folder::new<Torch::Tao>(vec1));
        //Root::create<Folder::Folder<Torch::Tao>>(account, Folder::new<Torch::Tao>(Root::extract<Folder::Folder<Torch::Torch>>(account));
        //Offer::create<Folder::Folder<Torch::Tao>>(account, Root::extract<Folder::Folder<Torch::Tao>>(account), 0x1);
    }
}

//! new-transaction
//! sender: bob
script {
    //use {{sender}}::Torch;
    //use {{sender}}::Folder;
    //use {{sender}}::Root;

    fun main(_account: &signer) {
        //Folder::add<Torch::Tao>(Root::extract<Folder::Folder<Torch::Tao>>(account), Torch::new());
    }
}
package br.com.alura.agenda;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class ListaAlunosActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        define conteudo do layout
        setContentView(R.layout.activity_lista_alunos);

//        base de dados
        String[] alunos = {"Daniel", "Ronaldo", "Jefferson", "Felipe", "Juliana", "Larissa", "Bianca", "Mariana"};

//        Busca componente pela id
        ListView listaAlunos = (ListView) findViewById(R.id.lista_alunos);

//        Define base de dados utilizando uma disposição ao componente a ser adaptado
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, alunos);

//        Adapta o conteúdo no componente
        listaAlunos.setAdapter(adapter);


    }
}

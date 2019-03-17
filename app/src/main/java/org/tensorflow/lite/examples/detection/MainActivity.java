package org.tensorflow.lite.examples.detection;

import android.os.Build;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import com.google.firebase.database.ChildEventListener;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

public class MainActivity extends AppCompatActivity {
    private ScrollView scrollView;
    private TextView mPastValues;
    String pastValues;
    private FirebaseDatabase database = FirebaseDatabase.getInstance();
    DatabaseReference myRef  = database.getReference("Android").child(Build.MODEL).child("Objects");
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        scrollView = (ScrollView)findViewById(R.id.scrollView);
        mPastValues = new TextView(this);
        myRef.addChildEventListener(new ChildEventListener() {
            @Override
            public void onChildAdded(@NonNull DataSnapshot dataSnapshot, @Nullable String s) {
                MainActivity mainActivity = dataSnapshot.getValue(MainActivity.class);
                Toast.makeText(mainActivity, mainActivity.getTitle(), Toast.LENGTH_SHORT).show();
//                showData(dataSnapshot);
//                mPastValues.setText(pastValues);
//                Toast.makeText(MainActivity.this, mPastValues.getText().toString(), Toast.LENGTH_SHORT).show();
//                scrollView.addView(mPastValues);
            }

            @Override
            public void onChildChanged(@NonNull DataSnapshot dataSnapshot, @Nullable String s) {
//                showData(dataSnapshot);
//                mPastValues.setText(pastValues);
//                scrollView.addView(mPastValues);
//                Toast.makeText(MainActivity.this, "asdf", Toast.LENGTH_SHORT).show();
            }

            @Override
            public void onChildRemoved(@NonNull DataSnapshot dataSnapshot) {
//                showData(dataSnapshot);
//                mPastValues.setText(pastValues);
//                scrollView.addView(mPastValues);
//                Toast.makeText(MainActivity.this, "asdf", Toast.LENGTH_SHORT).show();
            }

            @Override
            public void onChildMoved(@NonNull DataSnapshot dataSnapshot, @Nullable String s) {
//                showData(dataSnapshot);
//                mPastValues.setText(pastValues);
//                scrollView.addView(mPastValues);
//                Toast.makeText(MainActivity.this, "asdf", Toast.LENGTH_SHORT).show();
            }

            @Override
            public void onCancelled(@NonNull DatabaseError databaseError) {

            }
        });
//        myRef.child("random").setValue("random");
    }
    private void showData(DataSnapshot dataSnapshot) {
        for(DataSnapshot ds: dataSnapshot.getChildren()) {
            MainActivity mainActivity = new MainActivity();
//            Toast.makeText(mainActivity, ds.getKey(), Toast.LENGTH_SHORT).show();
            pastValues = ds.getKey() + ds.getChildren();

        }
    }
}

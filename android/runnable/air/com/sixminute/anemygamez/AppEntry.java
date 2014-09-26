package air.com.sixminute.anemygamez;


import android.app.Activity;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

public class AppEntry extends Activity {

    private Button button;
    
    private static TextView textView;
    
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setTheme(android.R.style.Theme_Translucent_NoTitleBar_Fullscreen);
		getWindow().setBackgroundDrawable(new ColorDrawable(android.graphics.Color.TRANSPARENT));
        
        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams rlp = new LinearLayout.LayoutParams(
    		RelativeLayout.LayoutParams.MATCH_PARENT,
    		RelativeLayout.LayoutParams.MATCH_PARENT
		);
        
        setContentView(layout, rlp);
        
        final Activity activity = this;
        
        StaticFunctions.Initialise(activity);

        button = new Button(this);
        button.setText("View More Games");
        layout.addView(button);
        button.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
            	 StaticFunctions.ViewMoreGames(activity);
        	}
        });
    }

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
    }
    
    protected void addText(String msg) {
		textView.append("\n" + msg);
	}
}
Shader "Alannis/LUTShader"
{
   Properties
    { 
        _MainTex ("Texture", 2D) = "white" {} // base texture for reference in level of lut
        _LUT("LUT", 2D) = "white" {} //Look up table to be used
        _Contribution("Contribution", Range(0, 1)) = 1 //level of look up table used
    }
    SubShader
    { 
        
        Cull Off ZWrite Off ZTest Always //Turns of culling and depth testing in this 
        Pass
        { 
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #define COLORS 32.0 //sets level of Luts to be used
            struct appdata
            { 
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

        struct v2f
        { 
            float2 uv : TEXCOORD0;
            float4 vertex : SV_POSITION;
        };

        //taked in vertices of object in referece to the clipping plane
        v2f vert (appdata v)
        {
            v2f o;
            o.vertex = UnityObjectToClipPos(v.vertex);
            o.uv = v.uv;
            return o;
        }

        //calling variablesinside shader
        sampler2D _MainTex;
        sampler2D _LUT;
        float4 _LUT_TexelSize;
        float _Contribution;

        fixed4 frag (v2f i) : SV_Target
        {
            float maxColor = COLORS - 1.0; //to create an array(of sorts) of colours the first colour will be 0 instead of at 1 so it subtracts ones as that is the maxium colour it can get to 
            fixed4 col = saturate(tex2D(_MainTex, i.uv));// enures that the colour is above 0
            float halfColX = 0.5 / _LUT_TexelSize.z;  //gets size of texture and finds the mid point
            float halfColY = 0.5 / _LUT_TexelSize.w; //gets size of texture and finds the midpoint
            float threshold = maxColor / COLORS; //sets range of colours that it can go through and render
            float xOffset = halfColX + col.r * threshold / COLORS; // offsest the current colour square by the range of colours
            float yOffset = halfColY + col.g * threshold;
            float cell = floor(col.b * maxColor);
            float2 lutPos = float2(cell / COLORS + xOffset, yOffset);//selects what lut is being used.
            float4 gradedCol = tex2D(_LUT, lutPos); //full current lit being used 
            return lerp(col, gradedCol, _Contribution); //Lerps the colours between base texture and lut 
        }
        ENDCG 
        }
    }
}

Shader "Custom/CustomLambert"
{
    Properties 
    {
        _Albedo("Albedo Color",Color)=(1,1,1,1)

    }
    SubShader
    {
        Tags
        {
            "queue"= "Geometry"
            "Rendertype"="Opeque"
        }
        CGPROGRAM
           half4 _Albedo;
           
           #pragma surface surf CustomLambert
           half4 LightingCustomLambert (SurfaceOutput s, half3 lightDir, half atten) 
           {
               half NdotL = dot(s.Normal, lightDir);
               half4 c;
               c.rgb=s.Albedo * _LightColor0.rgb * NdotL * atten;
               c.a= s.Alpha;
               return c;
           }
           struct Input
           {
               float2 uv_MainTex;
           };
           void surf(Input IN, inout SurfaceOutput o)
           {
               o.Albedo=_Albedo.rgb;
           }
        ENDCG

    }
}



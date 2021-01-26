Shader "Custom/SurfaceDiffuseColor"
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
           float4 _Albedo;
           #pragma surface surf Lambert
           struct Input
           {
               float2 uv_MainTex;
           };
           void surf(Input IN, inout SurfaceOutput o)
           {
               o.Albedo=_Albedo;
           }
        ENDCG

    }
}



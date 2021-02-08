Shader "Custom/SDRimLight"
{
    Properties 
    {
        _Albedo("Albedo Color",Color)=(1,1,1,1)
        [HDR] _RimColor("Rim Color",Color)=(1,0,0,1)
        _RimPower("Rim Power", Range(0.0,8.0))=1.0

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
           half4 _RimColor;
           float _RimPower;
           #pragma surface surf Lambert

           struct Input
           {
               float3 viewDir;
           };

           void surf(Input IN, inout SurfaceOutput o)
           {
               o.Albedo=_Albedo.rgb;
               float3 nVwd= normalize(IN.viewDir);
               float3 NdotL= dot(nVwd, o.Normal);
               half rim= 1- saturate(NdotL);
               o. Emission=_RimColor.rgb*pow(rim,_RimPower); 

           }
        ENDCG

    }
}



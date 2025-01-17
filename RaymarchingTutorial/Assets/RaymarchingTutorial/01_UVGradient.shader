﻿Shader "Unlit/01_UVGradient"
{
    Properties { }
    SubShader
    {
        Tags { "RenderType" = "Opaque" }
        
        Pass
        {
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag
            
            #include "UnityCG.cginc"
            
            struct appdata
            {
                float4 vertex: POSITION;
                float2 uv: TEXCOORD0;
            };
            
            struct v2f
            {
                float2 uv: TEXCOORD0;
                float4 vertex: SV_POSITION;
            };
            
            v2f vert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }
            
            float4 frag(v2f i): SV_Target
            {
                // UVグラディエントの色を計算します
                float4 col = float4(i.uv, 0.0, 1.0);
                return col;
            }
            ENDCG
            
        }
    }
}

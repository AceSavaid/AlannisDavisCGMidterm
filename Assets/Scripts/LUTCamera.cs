using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LUTCamera : MonoBehaviour
{
    public Material LUTMaterial;
    public Material[] materials;//array of materials to toggle 
    bool dessertOn = false;
    //takes in the source screen that is being rendered.
    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        Graphics.Blit(source, destination, LUTMaterial); //Draws the Look up table over the screen
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Alpha2))
        {
            if (dessertOn) //when toggled
            {
                LUTMaterial = materials[1]; //canges lut being used by camera to the desert array
            }
            else //when not on
            {
                LUTMaterial = materials[0]; // changes lut back to normal lut
            }
            dessertOn = !dessertOn; //inverse the current state of the toggle
        }
    }
}

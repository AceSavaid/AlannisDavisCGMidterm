using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ObjectOnToggle : MonoBehaviour
{
    public GameObject objectToToggle; //game object that is being toggled on or off
    bool toggleOn = true;
    

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Alpha1))
        {
            toggleOn = !toggleOn; //inverse current value of the bool
            objectToToggle.SetActive(toggleOn); //sets that value to the active to turn on and off the forcefield
        }

    }
}

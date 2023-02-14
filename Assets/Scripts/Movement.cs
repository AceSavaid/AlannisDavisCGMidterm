using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Movement : MonoBehaviour
{
    //due to time its set bewteen points
    public Transform position1;
    public Transform position2;
    bool inverse = false;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (inverse)
        {
            gameObject.transform.position = Vector3.MoveTowards(transform.position, position1.position, Time.deltaTime);
        }
        else
        {
            gameObject.transform.position = Vector3.MoveTowards(transform.position, position2.position, Time.deltaTime);
        }
        
    }
}

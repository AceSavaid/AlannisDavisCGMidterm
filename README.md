# AlannisDavisCGMidterm
## Resources Used
Photoshop similar app - (Medibang Paint Pro) to create the Lut
Textures for the ship were from a previous tutorial.

##Game
![image](https://user-images.githubusercontent.com/69608587/218817398-42f8b4a5-d2f6-4b46-bfa4-10002ed2024d.png)

In reference to this image

## Tasks
### Add a force field to the ship that maintains its shape with an appearance that suits the style of the game.
A forcefield is a mixture of having rim lighting with the added effect of transparency.
Rim Lighting is the effect of the the outlines of teh shape having the most colour while the inside of the shape is dark.  To find the centre first dot procuct of the normalized view direction (so that it is set in the range of 1) and the normal is found.  Next the saturate equation is used so that the value is brought between 0 and 1 for the function to work best. Leaving it as it is would result in the center of the shape being 1 (most colour applied) and the outer parts of the shape being 0 (the least colour and saturation applied).  To get the inverse, this is then subtracted from one so the center become 1-1 = 0 and the outmost parts of the object being 1-0=1. 
After this rim lighting is applied, instead of leaving this as is, to get the wanted transparency on the object the material is set to be transparent and the level of transparecy is it using the aformentioned equation for rim lighting but taking out the part of inverting it. 
*Saturate(dot(Normalize(view direction), Normal))*  

**The forcefield can be toggled on and off with the 1 key.**  
Off  
![image](https://user-images.githubusercontent.com/69608587/218819635-17ae3563-5b30-4af0-8f6d-1516238f73bc.png)  

On  
![image](https://user-images.githubusercontent.com/69608587/218819558-5136c8e4-5b0b-49ac-a153-d8da8d5c75c6.png)  


### Change the color of the background to create the feeling of changing levels from a green to a desert scene
For this one when I saw changing the colour of the environment I assumed a LUT (Look-Up Table) was to be used.  
 

Note for the most optimal implementation of the LUT, the LUT textures were set to Clamp Wrap Mode and no mipmaps were generated.  This is to stop any wrapping or filtering issues. 
I made a dessert Lut to accompany the base lut for this project which **can be toggled on and off with the 2 key.**  

using UnityEngine;

public class CustomButton : MonoBehaviour
{
    public void OnChildClicked() {
        Debug.Log($"Clicked on {gameObject.name} via a child.");
    }
}
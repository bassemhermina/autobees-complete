using UnityEditor;
using UnityEngine;

[InitializeOnLoad]
public static class PlayModeAssetProcessor
{
    static PlayModeAssetProcessor()
    {
        // Subscribe to Play Mode state changes
        EditorApplication.playModeStateChanged += OnPlayModeStateChanged;
    }

    private static void OnPlayModeStateChanged(PlayModeStateChange state)
    {
        if (state == PlayModeStateChange.ExitingEditMode)
        {
            Debug.Log("Refreshing and reimporting assets before Play Mode...");
            AssetDatabase.Refresh(); // Refresh all assets
            Debug.Log("Assets refreshed.");
        }
    }
}
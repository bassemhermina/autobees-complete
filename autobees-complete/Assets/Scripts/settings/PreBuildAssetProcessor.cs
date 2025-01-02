using UnityEditor;
using UnityEngine;

public class PreBuildAssetProcessor : UnityEditor.Build.IPreprocessBuildWithReport
{
    public int callbackOrder => 0;

    public void OnPreprocessBuild(UnityEditor.Build.Reporting.BuildReport report) {
        Debug.Log("Refreshing and reimporting assets before build...");
        AssetDatabase.Refresh();
        AssetDatabase.ImportAsset("Assets", ImportAssetOptions.ForceUpdate);
        Debug.Log("Assets refreshed and reimported.");
    }
}
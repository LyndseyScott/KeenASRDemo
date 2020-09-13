# KeenASRDemo

***Corresponding tutorial available [here](https://medium.com/@lyndseyscott/keenasr-ios-tutorial-6d299b7fff4d?source=friends_link&sk=87956b209884e173a861b9a00340c2e9<br>).***

In order to run either the Storyboard or SwiftUI final projects in this repository, you must first install the KeenASR SDK and language bundle by either following the steps in the tutorial linked above or the quickstart steps listed below.

## SDK & Bundle Download Instructions

Download then unzip the trial framework:
> [http://keenresearch.com/keenasr-downloads/KeenASR-Framework.tar.gz](http://keenresearch.com/keenasr-downloads/KeenASR-Framework.tar.gz)

and English language ASR Bundle:
> [http://keenresearch.com/keenasr-downloads/keenB2mQT-nnet3chain-en-us.tgz](http://keenresearch.com/keenasr-downloads/keenB2mQT-nnet3chain-en-us.tgz).

Note: By downloading the SDK or ASR Bundles you agree to the Trial SDK Licensing Agreement:
> [https://keenresearch.com/keenasr-docs/keenasr-trial-sdk-licensing-agreement.html](https://keenresearch.com/keenasr-docs/keenasr-trial-sdk-licensing-agreement.html)

## SDK Installation

Copy and paste the **KeenASR.framework** folder contained in the unzipped framework directory, ex. **KeenASR-Framework-trial-v1_8-Release/KeenASR.framework**, into your working project's directory, ex. **KeenASRDemo/SwiftUI Project/Starter Project**.

Then open **KeenASRDemo.xcodeproj** in Xcode. Tap the **KeenASRDemo** target at the top of the left-hand Project Navigator panel, navigate to the target's **General** configuration page, scroll down to the **Frameworks, Libraries, and Embedded Content** section then tap the **+** icon at the bottom of the table.

Open the **Add Other...** drop-down menu in the bottom left, tap **Add Files...**, navigate to the working project's directory, select **KeenASR.framework** then tap **Open** to add it to your project.

## Bundle Installation

Drag and drop the ASR bundle, ex. **keenB2mQT-nnet3chain-en-us**, into Xcode's left-hand Project Navigator panel. The **Choose options for adding these files** window should pop up. Check **Copy items if needed**, choose the **Create folder references** option beside **Added folders**, check the project target next to **Add to targets** then tap **Finish**. The ASR Bundle should then appear as a blue folder in the Project Navigator.

## App Signing

Navigate to your target's **Signing & Capabilities** tab and if you haven't already logged in, tap **Add Account…** next to **Team** to login in with your Apple ID. If you're enrolled in the Apple Developer Program, select a valid development team for signing; otherwise, if you are not a member of the Apple Developer Program, Xcode will automatically create a personal team for you.

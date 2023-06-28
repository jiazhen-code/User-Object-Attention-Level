# User-Object-Attention Level (UOAL) Dataset

User-Object-Attention Level (UOAL) is a dataset that contains the ground truth attentions of *30 users* to *96 objects* obtained from *1000 images*. UOAL can be used to study the attention distribution of different users to different objects in the virtual Metaverse services.

**More data will be updated to UOAL in the future**

With the help of UOAL, we can simulate the sparse user-object interaction records and help to design the resource allocation algorithm for virtual services.

## Description of UOAL

### Dataset Structure

The complete UOAL can be downloaded from the following Google drive link:

<!-- https://drive.google.com/drive/folders/1x8NIiA6gxxMBHPebEoxNAd1a7sHc7g_Y?usp=sharing -->
https://drive.google.com/drive/folders/1x8NIiA6gxxMBHPebEoxNAd1a7sHc7g_Y?usp=sharing

The file structure is
```
UOAL/
  -Images/
    -1.jpg
    - ...
    -1000.jpg
  -Labels/
    -1.txt
    - ...
    -1000.txt
  -Attention/
    -User1/
      -1.npy
      - ...
      -1000.npy
    -User2/
    - ...
    -User30/
```
where "**Images**" contains the original filtered 1000 images, "**Attention**" contains 30 × 1000 .npy format files to show the users' attention to each image, and "**Labels**" contains 1000 txt files to show the labels in each corresponding figure. 

The total 96 kinds of object labels are:
'wall', 'building', 'sky', 'floor', 'tree', 'ceiling', 'road', 'bed ',
        'windowpane', 'grass', 'cabinet', 'sidewalk', 'person', 'earth',
        'door', 'table', 'mountain', 'plant', 'curtain', 'chair', 'car',
        'water', 'painting', 'sofa', 'shelf', 'house', 'sea', 'mirror', 'rug',
        'field', 'armchair', 'seat', 'fence', 'desk', 'rock', 'wardrobe',
        'lamp', 'bathtub', 'railing', 'cushion', 'base', 'box', 'column',
        'signboard', 'chest of drawers', 'counter', 'sand', 'sink',
        'skyscraper', 'fireplace', 'refrigerator', 'grandstand', 'path',
        'stairs', 'runway', 'case', 'pool table', 'pillow', 'screen door',
        'stairway', 'river', 'bridge', 'bookcase', 'blind', 'coffee table',
        'toilet', 'flower', 'book', 'hill', 'bench', 'countertop', 'stove','palm', 
	'kitchen island', 'computer', 'swivel chair', 'boat', 'bar',
        'arcade machine', 'hovel', 'bus', 'towel', 'light', 'truck', 'tower',
        'chandelier', 'awning', 'streetlight', 'booth', 'television receiver',
        'airplane', 'dirt track', 'apparel', 'pole', 'land', 'bannister',
        'escalator', 'ottoman', 'bottle', 'buffet', 'poster', 'stage', 'van',
        'ship', 'fountain', 'conveyer belt', 'canopy', 'washer', 'plaything',
        'swimming pool', 'stool', 'barrel', 'basket', 'waterfall', 'tent',
        'bag', 'minibike', 'cradle', 'oven', 'ball', 'food', 'step', 'tank',
        'trade name', 'microwave', 'pot', 'animal', 'bicycle', 'lake',
        'dishwasher', 'screen', 'blanket', 'sculpture', 'hood', 'sconce',
        'vase', 'traffic light', 'tray', 'ashcan', 'fan', 'pier', 'crt screen',
        'plate', 'monitor', 'bulletin board', 'shower', 'radiator', 'glass',
        'clock', 'flag'
	
The corresponding serial numbers are:
0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 26, 27, 28, 30, 31, 32, 33, 34, 36, 38, 39, 41, 42, 43, 44, 45, 46, 47, 51, 53, 55, 57, 62, 63, 64, 66, 67, 69, 71, 74, 75, 80, 81, 82, 83, 85, 86, 87, 89, 92, 93, 97, 98, 100, 102, 108, 110, 112, 115, 116, 119, 120, 123, 124, 125, 127, 131, 132, 134, 135, 136, 137, 138, 139, 141, 142, 143, 144, 146, 147, 148

### Data Collection Method
The original images and the corresponding attention values are from *PSM*, a personalized saliency map dataset, where an "*Eyefollower*" eye tracker is used to record each individual's gaze patterns and produce a set of 48,000 (1600 × 30) eye fixation maps.

For more details about PSM, please refer to the following Github link:
https://github.com/xuyanyu-shh/Personalized-Saliency

Here, the 1000 images are manually selected, and the labels are obtained with the help of *K-Net* (“K-Net: Towards Unified Image Segmentation”, *Advances in Neural Information Processing Systems*), a semantic segmentation algorithm.

For more details about K-Net, please refer to the following Github link:
https://github.com/ZwwWayne/K-Net/

## Description of Codes

We show how to use UOAL to generate randomly the sparse user-object-attention matrix for the reasearch of virtual Metaverse services.

Download UOAL to ./UOAL in advance, and run:
```shell
cd ./data_generate
python convert.py  
```
Then you obtain the output file `my_rating.csv` that contains four columns, i.e.,  `userId,objectId,rating,timestamp`.

You could change `n_clusters` to decide the number of clusters, and `chose_group` to decide the number of images per user sees.



## Reference

If you use this dataset or code as part of your research, please cite the following paper, thanks

[R1] Hongyang Du, Jiazhen Liu, Dusit Niyato, Jiawen Kang, Zehui Xiong, Junshan Zhang, and Dong In Kim. ["Attention-aware resource allocation and QoE analysis for Metaverse xURLLC services."](https://arxiv.org/abs/2208.05438) IEEE Journal on Selected Areas in Communications (2023).

[R2] Hongyang Du, Jiacheng Wang, Dusit Niyato, Jiawen Kang, Zehui Xiong, Xuemin Sherman Shen, and Dong In Kim. ["Exploring attention-aware network resource allocation for customized Metaverse services."](https://arxiv.org/abs/2208.00369) IEEE Network (2022).

The bib is:
```bibtex
@article{du2022attention,
  title={Attention-aware Resource Allocation and {QoE} Analysis for Metaverse x{URLLC} Services},
  author={Du, Hongyang and Liu, Jiazhen and Niyato, Dusit and Kang, Jiawen and Xiong, Zehui and Zhang, Junshan and Kim, Dong In},
  journal={IEEE Journal on Selected Areas in Communications},
  year={to appear, 2023}
}
```
```bibtex
@article{du2022exploring,
  title={Exploring attention-aware network resource allocation for customized Metaverse services},
  author={Du, Hongyang and Wang, Jiacheng and Niyato, Dusit and Kang, Jiawen and Xiong, Zehui and Shen, Xuemin Sherman and Kim, Dong In},
  journal={IEEE Network},
  year={2022}
}
```


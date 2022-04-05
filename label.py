# import numpy as np
# import pandas as pd
# gd = np.loadtxt('gd.txt')
#
# df = pd.read_csv('my_rating.csv')
# userId = df['userId']
# movieId = df['movieId']
# rating = list(df['rating'])
#
# for s, i in enumerate(userId):
#     u = i
#     m = movieId[s]
#     rating[s] = gd[int(u)][int(m)]
#
# df['rating'] = rating
#
# df.to_csv('my_rating_label.csv', index=False)
#

import numpy as np

hots = np.loadtxt('hots.txt')

ind = np.argsort(hots.sum(axis=0))
pass

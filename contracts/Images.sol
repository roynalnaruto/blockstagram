pragma solidity 0.4.15;

/**
 * contract for storing image info
 * @author ROHIT NARURKAR <rohitnarurkar@gmail.com>
 */
contract Images {

  struct Image {
    address poster;
    string title;
    uint totalLikes;
    uint unpaidLikes;
  }

  string[] imageIds;
  mapping(string => Image) images;

  /**
   * modifier to make sure poster does not like own image
   */
  modifier userNotPoster(string _ipfsHash) {
    require(images[_ipfsHash].poster != msg.sender);
    _;
  }

  /**
   * user adds image to blockstagram
   * @param _ipfsHash Hash from file uploaded to ipfs
   * @param _title Title given to image by poster/user
   */
  function addImage(string _ipfsHash, string _title) {
    imageIds.push(_ipfsHash);
    images[_ipfsHash] = Image({
        poster: msg.sender,
        title: _title,
        totalLikes: 0,
        unpaidLikes: 0
      });
  }

  /**
   * user likes an image
   * @param  _ipfsHash Hash of the liked image
   */
  function likeImage(string _ipfsHash) userNotPoster(_ipfsHash) {
    images[_ipfsHash].totalLikes = images[_ipfsHash].totalLikes + 1;
    images[_ipfsHash].unpaidLikes = images[_ipfsHash].unpaidLikes + 1;
  }
}
